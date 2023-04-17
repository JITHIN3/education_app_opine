import 'dart:convert';

import 'package:education_app_opine/Apis/Apidata.dart';
import 'package:education_app_opine/ConstantWidget/navigationdrawer.dart';
import 'package:education_app_opine/Models/noticeboard_modal.dart';
import 'package:education_app_opine/Preferaneces/preferances.dart';
import 'package:education_app_opine/Screens/NotificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class NoticeBoardScreen extends StatefulWidget {
  const NoticeBoardScreen({Key? key}) : super(key: key);

  @override
  State<NoticeBoardScreen> createState() => _NoticeBoardScreenState();
}

class _NoticeBoardScreenState extends State<NoticeBoardScreen> {

  NoticeBoardModal noticeBoardModal = new NoticeBoardModal();
  List<NoticeBoardDetailModal> noticeBoardDetailModal =[];
  // final List<bool> isExpanded = List.filled(2, false);
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    getNoticeBoardDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return isLoading?Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: Color(0xFF6867FF),),
      ),
    ): Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        drawer: NaviagtionDrawer(),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xFFF8F8F8),
            title: Text('Noticeboard'),
            titleTextStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.black),
            centerTitle: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: InkWell(
                    child: Icon(
                      Icons.notifications,
                      color: Color.fromARGB(255, 6, 13, 26),
                      size: 25,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ShowNotifications(),
                        ),
                      );
                    }),
              ),
            ]),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: noticeBoardDetailModal.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 22),
                    padding: EdgeInsets.symmetric(vertical: 17, horizontal: 22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: .8,
                          blurRadius: 4,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          noticeBoardDetailModal[index].date.toString(),
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Color(0xFF494949),
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          noticeBoardDetailModal[index].newsHeading.toString(),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          noticeBoardDetailModal[index].newsSubHeading.toString(),
                          style: TextStyle(fontSize:12.0,fontWeight: FontWeight.w400,color: Color(0xFF7D7D7D)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: double.infinity,
                            height: 142.0,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'lib/Assets/background/notice.png',
                                fit: BoxFit.cover,
                                semanticLabel: "Cover Image",
                                repeat: ImageRepeat.noRepeat,
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          noticeBoardDetailModal[index].newsContent.toString(),
                          maxLines: noticeBoardDetailModal[index].isExpanded ? null : 3,
                          overflow: noticeBoardDetailModal[index].isExpanded
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, height: 1.5),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              noticeBoardDetailModal[index].isExpanded = !noticeBoardDetailModal[index].isExpanded;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                noticeBoardDetailModal[index].isExpanded ? "Less" : "Read more",
                                style: TextStyle(color: Color(0xFF2648BD)),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                noticeBoardDetailModal[index].isExpanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                size: 20,
                                color: Color(0xFF2648BD),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ));
  }

  Future getNoticeBoardDetails() async {
    isLoading = true;
    setState(() {});
    Preferances().getToken().then((value) async {
      var response =
      await http.post(Uri.parse(ApiData.FETCH_NOTICEBOARD_DETAILS), body: value);
      var responsebody = json.decode(response.body);
      isLoading = false;
      if (responsebody['status'] == 200) {
        final resdata = responsebody['data'];
        List dataList = resdata['details'];
        noticeBoardModal = NoticeBoardModal.fromJson(resdata);
        noticeBoardDetailModal = dataList
            .map((spacecraft) => new NoticeBoardDetailModal.fromJson(spacecraft))
            .toList();
        setState(() {});
      }
    });
  }
}
