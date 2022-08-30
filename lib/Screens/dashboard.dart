import 'dart:convert';

import 'package:education_app_opine/ConstantWidget/navigationdrawer.dart';
import 'package:education_app_opine/Models/StudenModel.dart';
import 'package:education_app_opine/Provider/provider_block.dart';
import 'package:education_app_opine/Screens/FeePayment/feespage1.dart';
import 'package:education_app_opine/Screens/calanderscreen.dart';
import 'package:education_app_opine/Screens/chat/personalchatscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Apis/Apidata.dart';
import '../ConstantWidget/query/screensize.dart';
import '../Preferaneces/preferances.dart';
import 'mainhome.dart';
import 'package:http/http.dart' as http;

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStudentDetails();
  }

  bool isLoading = true;
  StudentDetailModel studentList = new StudentDetailModel();

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(elevation: 0, backgroundColor: Colors.white, actions: [
          Padding(
            padding: EdgeInsets.only(top: 20, right: 15),
            child: Icon(
              Icons.notifications,
              color: Color.fromARGB(255, 6, 13, 26),
              size: 25,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 20, left: 10, right: 15),
              child: Container(
                width: 30,
                child: CircleAvatar(
                    radius: 18,
                    backgroundImage:
                        NetworkImage(provider.studentList.imageUrl.toString())),
              )),
        ]),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                provider.studentList.name.toString(),
                style: TextStyle(
                    color: Color.fromARGB(255, 6, 13, 26), fontSize: 25),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [

                    Padding(
                      padding: EdgeInsets.only(left: 20,top: 10),
                      child: Container(
                        width: 24,
                        height: 23,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("lib/Assets/shield.png"),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            provider.studentList.dataClass.toString(),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 6, top: 10),
                        child: Text(
                          provider.studentList.division.toString(),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //1st

                Padding(
                  padding: EdgeInsets.only(top: 30, left: 20),
                  child: InkWell(
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      width: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: Image(
                                  width: 35,
                                  image: AssetImage("lib/Assets/message.png")),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(
                              child: Text(
                                "Message",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => AdminMessageScreen()),
                      );
                    },
                  ),
                ),

                //2nd

                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: InkWell(
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      width: 80,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: Image(
                                  width: 30,
                                  image: AssetImage("lib/Assets/calandar.png")),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(
                                child: Text(
                              "Calendar",
                              style: TextStyle(fontSize: 12),
                            )),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => CalendarScreen()),
                      );
                    },
                  ),
                ),

                //3rd

                Padding(
                  padding: EdgeInsets.only(top: 30, right: 10),
                  child: InkWell(
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      width: 80,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: Image(
                                  width: 30,
                                  image: AssetImage("lib/Assets/fee.png")),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(
                                child: Text(
                              "Fee",
                              style: TextStyle(fontSize: 12),
                            )),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FeePage1()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ]),
        ),
        drawer: NaviagtionDrawer(),
      );
    });
  }

  Future getStudentDetails() async {
    isLoading = true;
    setState(() {});
    Preferances().getToken().then((value) async {
      var response =
          await http.post(Uri.parse(ApiData.Student_Details), body: value);
      var responsebody = json.decode(response.body);

      isLoading = false;
      setState(() {});
      if (responsebody['status'] == 200) {
        studentList = StudentDetailModel.fromJson(responsebody["data"]);

        Provider.of<ApplicationProvider>(context, listen: false)
            .setAllStudentDetails(studentList);

        setState(() {});
      }
    });
  }
}
// Color.fromARGB(255, 6, 13, 26);
