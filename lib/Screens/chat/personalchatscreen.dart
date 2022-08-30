import 'dart:convert';

import 'package:education_app_opine/Apis/Apidata.dart';
import 'package:education_app_opine/Models/messagesentModel.dart';
import 'package:education_app_opine/Preferaneces/preferances.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


import '../../Models/AdminMessageModel.dart';
import '../../Provider/provider_block.dart';


class AdminMessageScreen extends StatefulWidget {
  const AdminMessageScreen({Key? key}) : super(key: key);

  @override
  State<AdminMessageScreen> createState() => _AdminMessageScreenState();
}

class _AdminMessageScreenState extends State<AdminMessageScreen> {
  TextEditingController messagecontroller = TextEditingController();
  List<MessageSentModel> messages = [];
  bool isLoading = false;
  List<AdminChatModel> listallchat = [];
  AdminChatModel adminchat = new AdminChatModel();









  @override
  void initState() {
    getAllChat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: .5,
          title: Text(
            "OfficeAdmin",
            style: TextStyle(fontSize: 17),
          ),
          leading: Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.keyboard_backspace_rounded)),
            ),
          ]),
        ),
        body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            _messageSpace(),
            // _inputSpace()
          ]),
        ),
      );
    });
  }

  Widget _messageSpace() {
    return Flexible(
        child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ListView.builder(
          physics: ScrollPhysics(),
          itemCount: listallchat.length,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 10),
          itemBuilder: (context, index) {
            return Column(
              children: [
                //
                // Container(
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(18),
                //       color: Colors.grey.shade200),
                //   padding: EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 7),
                //   child: listallchat[index].date == listallchat[index].date?Text(listallchat[index].date.toString(),):Container(),
                // ),
                //
                // Container(
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(18),
                //       color: Colors.grey.shade200),
                //   padding: EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 7),
                //   child: Text(
                //       listallchat[index].date!.day.toString() +
                //           " -" +
                //           listallchat[index].date!.month.toString() +
                //           "- " +
                //           listallchat[index].date!.year.toString(),
                //       style: TextStyle(color: Colors.black.withOpacity(.6))),
                // ),

                //
                Text(
                    listallchat[index].date!.day.toString() +
                        " -" +
                        listallchat[index].date!.month.toString() +
                        "- " +
                        listallchat[index].date!.year.toString(),
                    style: TextStyle(color: Colors.grey)),

                Container(
                  padding: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.blueAccent.shade200),
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 7, bottom: 7),
                          child: Row(children: [
                            Text(
                              listallchat[index].message.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            // Text("Tommorrow Maths class at 12.30 Am",style: TextStyle(color: Colors.white,),),
                            Padding(
                              padding: const EdgeInsets.only(left: 7, top: 13),
                              child: Text(
                                listallchat[index].time.toString(),
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.5),
                                    fontSize: 12),
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    ));
  }

  Widget _inputSpace() {
    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.white,
      child: Row(children: [
        Expanded(
          child: TextField(
            onSubmitted: (String str) {
              addMessage(messagecontroller.text);
            },
            controller: messagecontroller,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Enter Message",
                prefixIcon: Icon(Icons.emoji_emotions_outlined),
                suffixIcon: Icon(Icons.camera_alt),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
              onTap: () {
                setState(() {
                  addMessage(messagecontroller.text);
                });
              },
              child: Icon(Icons.send, size: 30)),
        ),
      ]),
    );
  }

  addMessage(String input) {
    messagecontroller.text + "";
    messages.add(MessageSentModel());
    setState(() {});
  }

  // Future<List<MessageSentModel>?> sentMessage() async {
  //   Preferances().getToken().then((value) async {
  //     var reqdata = jsonEncode({
  //       "Authorization":widget.studentModel.phone,
  //       "sent_to": widget.studentModel.email,
  //       "message":messagecontroller.text
  //     });
  //
  //     http.Response response = await http.post(
  //         Uri.parse(ApiData.SEND_OTP),headers: value,
  //         body: reqdata);
  //     String responseData = response.body.toString();
  //     var responsebody = jsonDecode(responseData);
  //
  //     if ( responsebody['status']== "Sucess") {
  //      print("message send");
  //
  //     } else {
  //       print("message send failed");
  //     }
  //   });
  // }
  Future getAllChat() async {

   isLoading = true;
   setState(() {});
   Preferances().getToken().then((value) async {
     var response =
     await http.post(Uri.parse(ApiData.ALL_Message), body: value);
     final responsebody = json.decode(response.body.toString());

     isLoading = false;
     setState(() {});
     if (responsebody['status'] == 200) {
       List dataList = responsebody['data'];
       if (null != dataList && dataList.length > 0) {
         listallchat = dataList
             .map((spacecraft) => new AdminChatModel.fromJson(spacecraft))
             .toList();
         // String data = packageModelList[0].id.toString();
       }
     }
     adminchat = AdminChatModel.fromJson(responsebody["data"]);
     Provider.of<ApplicationProvider>(context, listen: false)
         .setAdminChatDetails(adminchat);
     setState(() {});
   });

 }


  }

