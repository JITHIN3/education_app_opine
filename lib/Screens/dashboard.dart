import 'dart:convert';

import 'package:education_app_opine/ConstantWidget/navigationdrawer.dart';
import 'package:education_app_opine/Models/StudenModel.dart';
import 'package:education_app_opine/Provider/provider_block.dart';
import 'package:education_app_opine/Screens/calanderscreen.dart';
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
              padding: EdgeInsets.only(top: 30, left: 10, right: 15),
              child: Container(
                child:
                CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                        provider.studentList.imageUrl.toString())),
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
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: ClipRRect(
                            child: Image(
                                image: AssetImage("lib/Assets/shield.png"),
                                height: 24),
                          ),
                        ),
                        Positioned(
                            left: 28,
                            top: 24,
                            child: Text(
                              "4",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ))
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 6, top: 20),
                        child: Text(
                          "Level 4",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, right: 20),
                      child: Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 1.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                  2.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: ClipRRect(
                                  child: Image(
                                      image: NetworkImage(
                                          "https://cdn-icons-png.flaticon.com/512/733/733311.png"),
                                      height: 18),
                                )),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                "95 Coins",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: Helper.getScreenWidth(context),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Upcoming Session",
                          style: TextStyle(fontSize: 16)),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("08:28", style: TextStyle(fontSize: 25)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("AM", style: TextStyle(fontSize: 15)),
                        ),
                        SizedBox(
                          width: 110,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, right: 20),
                          child: Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue.withOpacity(.1),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.access_time_rounded,
                                    size: 20,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    "Alarm",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                      child: Divider(thickness: 1),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aHVtYW4lMjBmYWNlfGVufDB8fDB8fA%3D%3D&w=1000&q=80")),
                      title: Text(
                        "Styni Norman",
                        style: TextStyle(fontSize: 15),
                      ),
                      subtitle: Row(children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.7),
                              shape: BoxShape.circle),
                          child: Icon(Icons.star,
                              color: Colors.orange.shade300, size: 13),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "Starer",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 13),
                            ))
                      ]),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 20, left: 20, bottom: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CalendarScreen()),
                              );
                            },
                            child: Text(
                              "Reschedule",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.deepOrangeAccent,
                              fixedSize: Size(150, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                // side: BorderSide(color: Colors.black.withOpacity(.3)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20, right: 20, bottom: 20, left: 10),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Start Session ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.blue,
                              fixedSize: Size(150, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                // side: BorderSide(color: Colors.black.withOpacity(.3)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                  width: Helper.getScreenWidth(context),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 1.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                "Complete Profile",
                                style: TextStyle(fontSize: 17),
                              )),
                          Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                "75%",
                                style:
                                    TextStyle(fontSize: 17, color: Colors.blue),
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 20, bottom: 20),
                              child: Text(
                                "Update your bio to complete\nyour profile",
                                style: TextStyle(color: Colors.grey),
                              )),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20, right: 20),
                            child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    "https://imgs.developpaper.com/imgs/763274540-5dbfe3e12341a_articlex.png")),
                          )
                        ],
                      )
                    ],
                  )),
            )
          ]),
        ),
        drawer: NaviagtionDrawer(),);
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
