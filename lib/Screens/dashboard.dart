import 'dart:convert';

import 'package:education_app_opine/ConstantWidget/navigationdrawer.dart';
import 'package:education_app_opine/Models/StudenModel.dart';
import 'package:education_app_opine/Models/student_dashboard_modal.dart';
import 'package:education_app_opine/Provider/provider_block.dart';
import 'package:education_app_opine/Screens/FeePayment/fee_payment.dart';
import 'package:education_app_opine/Screens/FeePayment/feespage1.dart';
import 'package:education_app_opine/Screens/NotificationScreen.dart';
import 'package:education_app_opine/Screens/calanderscreen.dart';
import 'package:education_app_opine/Screens/chat/personalchatscreen.dart';
import 'package:education_app_opine/Screens/home/carousal_slider.dart';
import 'package:education_app_opine/Services/local_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
  bool isLoading = true;
  StudentDetailModel studentList = new StudentDetailModel();
  DashboardDetailsModal dashbordDetails = new DashboardDetailsModal();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStudentDashboard();
    getStudentDetails();

    Preferances().getStudentData().then((value) {
      studentList = value;
      setState(() {});
      // Topic based notification send
      FirebaseMessaging.instance
          .subscribeToTopic(studentList.studentId.toString());

      //Normal notification send

      // FirebaseMessaging.instance.getInitialMessage().then((message){
      //   if(message !=null){
      //     final routeFromMessage = message.data["route"];
      //     print(routeFromMessage);
      //   }
      // });

      FirebaseMessaging.onMessage.listen((message) {
        if (message.notification != null) {
          print(message.notification!.body);
          print(message.notification!.title);
        }
        LocalNotificationService.display(message);
      });

      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        final routeFromMessage = message.data["route"];

        print(routeFromMessage);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        appBar: AppBar(elevation: 0, backgroundColor:  Color(0xFFF8F8F8), actions: [
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
        body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                // height: ,
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child:Stack(
                        clipBehavior: Clip.none,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FeePaymentScreen()));
                            },
                            child: Container(
                              width: double.infinity,
                              height: 130,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color(0xFF7C99FF),
                                borderRadius:  BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset('lib/Assets/background/home1.png',
                                      // width: 109,
                                      height: 69,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text('Fee Payment',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white
                                            ),textAlign: TextAlign.center,),
                                          ),
                                          Container(
                                            child: Icon(
                                              Icons.keyboard_arrow_right_outlined,color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      Container(
                                        width: 100,
                                        child: Column(
                                          children: [
                                            // Text('Term 2',
                                            // style: TextStyle(
                                            //   fontSize: 12,
                                            //   fontWeight: FontWeight.w600,
                                            //   color: Colors.white
                                            // ),),
                                            // SizedBox(height:5),
                                            Text('₹${null!=dashbordDetails.grandTotal?dashbordDetails.grandTotal.toString():"0"}',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white
                                                )),
                                            SizedBox(height:15),
                                            LinearProgressIndicator(value:dashbordDetails.percentage,backgroundColor: Color(0xFFE7E0EC),minHeight: 5,valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFD600)),)
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ),
                          ),
                          Positioned(
                            top: -5,
                            left: -5,
                            width: 30,
                            height: 30,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:  BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: Image.asset('lib/Assets/background/pay.png'),
                            ),

                          ),
                          Positioned(
                            top: 75,
                            right: 0,
                            width: 15,
                            height: 30,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                borderRadius:  BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                              ),
                            ),

                          ),
                        ],
                      ),


                    ),
                    SizedBox(width: 20,),
                    Expanded(
                        flex:1,
                        child:Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 130,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color(0xFFF3F5FF),
                                borderRadius:  BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: .25,
                                    offset: Offset(0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Expanded(flex:2,child: Image.asset('lib/Assets/background/book.png',height: 56,)),
                                  Expanded(child: Text('25 March')),
                                  Expanded(flex:1,child: Text('Book Return Date',textAlign: TextAlign.center,overflow: TextOverflow.clip,style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF5B5B5B)
                                  ),),)

                                ],
                              ),
                            ),
                            Positioned(
                              top: 50,
                              left: 0,
                              width: 15,
                              height: 30,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  // borderRadius:  BorderRadius.all(
                                  //   Radius.circular(50),
                                  // ),
                                  borderRadius:  BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50)),
                                ),
                              ),

                            ),
                          ],
                        )

                    )
                  ],
                ),
              ),
              ImageCarousel(),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child:
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {  },
                              icon: Image.asset('lib/Assets/background/library.png',width: 47,height: 47,),
                            ),
                            Text('Library',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400
                            ),)
                          ],
                        )),
                        Expanded(child:
                        Column(
                          children: [
                            IconButton(
                              onPressed: () { Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FeePaymentScreen())); },
                              icon: Image.asset('lib/Assets/background/fee.png',width: 47,height: 47,),
                            ),

                            Text('Fee payment',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400
                              ),)
                          ],
                        )),
                        Expanded(child:
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CalendarScreen()));},
                              icon: Image.asset('lib/Assets/background/calendar.png',width: 47,height: 47,),
                            ),

                            Text('Calendar',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400
                              ),)
                          ],
                        )),
                      ],
                    ),
                    SizedBox(height: 44,),
                    Row(
                      children: [
                        Expanded(child:
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {  },
                              icon: Image.asset('lib/Assets/background/transport.png',width: 47,height: 47,),
                            ),
                            Text('Transportation',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400
                              ),)
                          ],
                        )),
                        Expanded(child:
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {  },
                              icon: Image.asset('lib/Assets/background/store.png',width: 47,height: 47,),
                            ),

                            Text('Stationary / Store',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400
                              ),)
                          ],
                        )),
                        Expanded(child:
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {  },
                              icon: Image.asset('lib/Assets/background/extra.png',width: 47,height: 47,),
                            ),

                            Text('Extra curricular',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400
                              ),)
                          ],
                        )),
                      ],
                    )
                  ],
                ),
              ),
              // Container(
              //   padding: EdgeInsets.all(20),
              //   child: Column(
              //     children: [
              //       Text('Student Portals',
              //       style:TextStyle(
              //         fontSize: 18.0,
              //         fontWeight: FontWeight.w500
              //       ))
              //     ],
              //   ),
              // )
            ],
          ),
        ),
        // SingleChildScrollView(
        //   child:
        //       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //     Padding(
        //       padding: EdgeInsets.only(left: 20, top: 20),
        //       child: Text(
        //         provider.studentList.name.toString(),
        //         style: TextStyle(
        //             color: Color.fromARGB(255, 6, 13, 26), fontSize: 25),
        //       ),
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Row(
        //           children: [
        //             Padding(
        //               padding: EdgeInsets.only(left: 20, top: 10),
        //               child: Container(
        //                 width: 24,
        //                 height: 23,
        //                 decoration: BoxDecoration(
        //                   image: DecorationImage(
        //                     fit: BoxFit.fill,
        //                     image: AssetImage("lib/Assets/shield.png"),
        //                   ),
        //                 ),
        //                 child: Center(
        //                   child: Text(
        //                     provider.studentList.dataClass.toString(),
        //                     style: TextStyle(
        //                         fontSize: 12,
        //                         color: Colors.white,
        //                         fontWeight: FontWeight.w500),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             Padding(
        //                 padding: EdgeInsets.only(left: 6, top: 10),
        //                 child: Text(
        //                   provider.studentList.division.toString(),
        //                   style: TextStyle(
        //                       fontSize: 15, fontWeight: FontWeight.w500),
        //                 )),
        //           ],
        //         ),
        //       ],
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         //1st
        //
        //         Padding(
        //           padding: EdgeInsets.only(top: 30, left: 20),
        //           child: InkWell(
        //             child: Container(
        //               height: 90,
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(25),
        //                 color: Colors.white,
        //                 boxShadow: [
        //                   BoxShadow(
        //                     color: Colors.grey.shade400,
        //                     blurRadius: 2.0,
        //                     spreadRadius: 0.0,
        //                     offset: Offset(
        //                         2.0, 2.0), // shadow direction: bottom right
        //                   )
        //                 ],
        //               ),
        //               width: 80,
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Padding(
        //                     padding: const EdgeInsets.only(top: 20),
        //                     child: Center(
        //                       child: Image(
        //                           width: 35,
        //                           image: AssetImage("lib/Assets/message.png")),
        //                     ),
        //                   ),
        //                   Padding(
        //                     padding: const EdgeInsets.only(top: 10),
        //                     child: Center(
        //                       child: Text(
        //                         "Message",
        //                         style: TextStyle(fontSize: 12),
        //                       ),
        //                     ),
        //                   )
        //                 ],
        //               ),
        //             ),
        //             onTap: () {
        //               Navigator.of(context).push(
        //                 MaterialPageRoute(
        //                     builder: (context) => AdminMessageScreen()),
        //               );
        //             },
        //           ),
        //         ),
        //
        //         //2nd
        //
        //         Padding(
        //           padding: EdgeInsets.only(top: 30),
        //           child: InkWell(
        //             child: Container(
        //               height: 90,
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(25),
        //                 color: Colors.white,
        //                 boxShadow: [
        //                   BoxShadow(
        //                     color: Colors.grey.shade400,
        //                     blurRadius: 2.0,
        //                     spreadRadius: 0.0,
        //                     offset: Offset(
        //                         2.0, 2.0), // shadow direction: bottom right
        //                   )
        //                 ],
        //               ),
        //               width: 80,
        //               margin: EdgeInsets.all(8),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Padding(
        //                     padding: const EdgeInsets.only(top: 20),
        //                     child: Center(
        //                       child: Image(
        //                           width: 30,
        //                           image: AssetImage("lib/Assets/calandar.png")),
        //                     ),
        //                   ),
        //                   Padding(
        //                     padding: const EdgeInsets.only(top: 10),
        //                     child: Center(
        //                         child: Text(
        //                       "Calendar",
        //                       style: TextStyle(fontSize: 12),
        //                     )),
        //                   )
        //                 ],
        //               ),
        //             ),
        //             onTap: () {
        //               Navigator.of(context).push(
        //                 MaterialPageRoute(
        //                     builder: (context) => CalendarScreen()),
        //               );
        //             },
        //           ),
        //         ),
        //
        //         //3rd
        //
        //         Padding(
        //           padding: EdgeInsets.only(top: 30, right: 10),
        //           child: InkWell(
        //             child: Container(
        //               height: 90,
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(25),
        //                 color: Colors.white,
        //                 boxShadow: [
        //                   BoxShadow(
        //                     color: Colors.grey.shade400,
        //                     blurRadius: 2.0,
        //                     spreadRadius: 0.0,
        //                     offset: Offset(
        //                         2.0, 2.0), // shadow direction: bottom right
        //                   )
        //                 ],
        //               ),
        //               width: 80,
        //               margin: EdgeInsets.all(8),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Padding(
        //                     padding: const EdgeInsets.only(top: 20),
        //                     child: Center(
        //                       child: Image(
        //                           width: 30,
        //                           image: AssetImage("lib/Assets/fee.png")),
        //                     ),
        //                   ),
        //                   Padding(
        //                     padding: const EdgeInsets.only(top: 10),
        //                     child: Center(
        //                         child: Text(
        //                       "Fee",
        //                       style: TextStyle(fontSize: 12),
        //                     )),
        //                   )
        //                 ],
        //               ),
        //             ),
        //             onTap: () {
        //               Navigator.of(context).push(
        //                 MaterialPageRoute(builder: (context) => FeePage1()),
        //               );
        //             },
        //           ),
        //         ),
        //       ],
        //     ),
        //   ]),
        // ),
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
        final resdata = responsebody['data'];
        String studentJson = jsonEncode(resdata);
        Preferances().setStudentData(studentJson);
        studentList = StudentDetailModel.fromJson(responsebody["data"]);

        Provider.of<ApplicationProvider>(context, listen: false)
            .setAllStudentDetails(studentList);

        setState(() {});
      }
    });
  }
  Future getStudentDashboard() async {
    isLoading = true;
    setState(() {});
    Preferances().getToken().then((value) async {
      var response =
      await http.post(Uri.parse(ApiData.STUDENT_DASHBOARD), body: value);
      var responsebody = json.decode(response.body);
      isLoading = false;
      if (responsebody['status'] == 200) {
        final resdata = responsebody['data'];
        dashbordDetails = DashboardDetailsModal.fromJson(resdata['details']);
        setState(() {});
      }
    });
  }
}
// Color.fromARGB(255, 6, 13, 26);
