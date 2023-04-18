import 'package:education_app_opine/Screens/AttendanceScreen.dart';
import 'package:education_app_opine/Screens/FeePayment/fee_payment.dart';
import 'package:education_app_opine/Screens/FeePayment/feespage1.dart';
import 'package:education_app_opine/Screens/Profile/profile_screen.dart';
import 'package:education_app_opine/Screens/ProfileScreen.dart';
import 'package:education_app_opine/Screens/calanderscreen.dart';
import 'package:education_app_opine/Screens/chat/allchat.dart';
import 'package:education_app_opine/Screens/chat/personalchatscreen.dart';
import 'package:education_app_opine/Screens/loginscreen.dart';
import 'package:education_app_opine/Screens/noticeboard/noticeboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Provider/provider_block.dart';

class NaviagtionDrawer extends StatefulWidget {
  const NaviagtionDrawer({Key? key}) : super(key: key);

  @override
  State<NaviagtionDrawer> createState() => _NaviagtionDrawerState();
}

class _NaviagtionDrawerState extends State<NaviagtionDrawer> {
  double fontsize = 14;
  double iconsize = 22;
  final color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // width:MediaQuery.of(context).size.width * .7,

      child: Material(
        // color: Colors.white,
        color: Color(0xFF7C99FF),
        child: SafeArea(
          child: SingleChildScrollView(child: Consumer<ApplicationProvider>(
              builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(30),
                  // child: CircleAvatar(
                  //     radius: 45,
                  //     backgroundImage: NetworkImage(
                  //         provider.studentList.imageUrl.toString()),
                  //
                  // ),
                  child: Container(
                    width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius:  BorderRadius.all(
                Radius.circular(50),
                ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 4,
                        blurRadius: 9,
                        offset: Offset(-6, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                      child: Image.network(provider.studentList.imageUrl.toString(),fit: BoxFit.cover,))),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: InkWell(
                    child: Text(
                      provider.studentList.name.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),
                    ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentProfile()));
                  },),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 8),
                  child: Text(
                    provider.studentList.email.toString(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: InkWell(
                    child: ListTile(
                        leading: Icon(
                          Icons.file_copy_outlined,
                          color: Colors.white,
                          size: iconsize,
                        ),
                        title: Text(
                          "Attendance",
                          style: TextStyle(
                              fontSize: fontsize, fontWeight: FontWeight.w600, color: Colors.white,),
                        ),
                    trailing: Icon(Icons.keyboard_arrow_down,color: Colors.white,)),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentsAttandece()));
                  }),
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 30, right: 30),
                //   child: Divider(thickness: 1),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FeePaymentScreen()));
                    },
                    child: ListTile(
                        leading: Icon(Icons.payment_outlined,
                            color:color, size: iconsize),
                        title: Text(
                          "Fee",
                          style: TextStyle(
                            fontSize: fontsize, fontWeight: FontWeight.w600, color: color,),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_down,color: color,)),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    child: ListTile(
                        leading: Icon(Icons.person,
                            color: color, size: iconsize),
                        title: Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: fontsize, fontWeight: FontWeight.w600, color: color,),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_down,color: color,)),
                 onTap: (){

                   Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => ProfileScreen()));
                 }, ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NoticeBoardScreen(),
                        ),
                      );
                    },
                    child: ListTile(
                        leading: Icon(Icons.info_sharp,
                            color: color, size: iconsize),
                        title: Text(
                          "Noticeboard",
                          style: TextStyle(
                            fontSize: fontsize, fontWeight: FontWeight.w600, color: color,),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_down,color: color,)),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    child: ListTile(
                        leading: Icon(Icons.message_outlined,
                            color: color, size: iconsize),
                        title: Text(
                          "Message",
                          style: TextStyle(
                            fontSize: fontsize, fontWeight: FontWeight.w600, color: color,),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_down,color: color,)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminMessageScreen()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CalendarScreen()));
                    },
                    child: ListTile(
                        leading: Icon(Icons.calendar_today_rounded,
                            color: color, size: iconsize),
                        title: Text(
                          "Calender",
                          style: TextStyle(
                            fontSize: fontsize, fontWeight: FontWeight.w600, color: color,),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_down,color: color,)),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 10),
                //   child: ListTile(
                //       leading: Icon(Icons.menu_book_outlined,
                //           color: color, size: iconsize),
                //       title: Text(
                //         "Syllabus",
                //         style: TextStyle(
                //           fontSize: fontsize, fontWeight: FontWeight.w600, color: color,),
                //       ),
                //       trailing: Icon(Icons.keyboard_arrow_down,color: color,)),
                // ),
                //
                // Padding(
                //   padding: const EdgeInsets.only(left: 10),
                //   child: ListTile(
                //       leading: Icon(Icons.analytics_outlined,
                //           color: color, size: iconsize),
                //       title: Text(
                //         "Mark",
                //         style: TextStyle(
                //           fontSize: fontsize, fontWeight: FontWeight.w600, color: color,),
                //       ),
                //       trailing: Icon(Icons.keyboard_arrow_down,color: color,)),
                // ),
                //
                // Padding(
                //   padding: const EdgeInsets.only(left: 10),
                //   child: ListTile(
                //       leading: Icon(Icons.library_books,
                //           color: color, size: iconsize),
                //       title: Text(
                //         "Library",
                //         style: TextStyle(
                //           fontSize: fontsize, fontWeight: FontWeight.w600, color: color,),
                //       ),
                //       trailing: Icon(Icons.keyboard_arrow_down,color: color,)),
                // ),
                //
                // Padding(
                //   padding: const EdgeInsets.only(left: 10),
                //   child: ListTile(
                //       leading: Icon(Icons.bookmark,
                //           color: color, size: iconsize),
                //       title: Text(
                //         "Achievements",
                //         style: TextStyle(
                //           fontSize: fontsize, fontWeight: FontWeight.w600, color: color,),
                //       ),
                //       trailing: Icon(Icons.keyboard_arrow_down,color: color,)),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 10),
                //   child: ListTile(
                //       leading: Icon(Icons.home_work_outlined,
                //           color: color, size: iconsize),
                //       title: Text(
                //         "Homework",
                //         style: TextStyle(
                //           fontSize: fontsize, fontWeight: FontWeight.w600, color: color,),
                //       ),
                //       trailing: Icon(Icons.keyboard_arrow_down,color: color,)),
                // ),
                //
                // Padding(
                //   padding: const EdgeInsets.only(left: 10),
                //   child: ListTile(
                //       leading: Icon(Icons.calendar_view_day,
                //           color: color, size: iconsize),
                //       title: Text(
                //         "Timetable",
                //         style: TextStyle(
                //           fontSize: fontsize, fontWeight: FontWeight.w600, color: color,),
                //       ),
                //       trailing: Icon(Icons.keyboard_arrow_down,color: color,)),
                // ),
                //
                // Padding(
                //   padding: const EdgeInsets.only(left: 10),
                //   child: ListTile(
                //       leading: Icon(Icons.calendar_today_outlined,
                //           color: color, size: iconsize),
                //       title: Text(
                //         "Exam Schedule",
                //         style: TextStyle(
                //           fontSize: fontsize, fontWeight: FontWeight.w600, color: color,),
                //       ),
                //       trailing: Icon(Icons.keyboard_arrow_down,color: color,)),
                // ),

                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    child: ListTile(
                        leading: Icon(Icons.logout,
                            color: color, size: iconsize),
                        title: Text(
                          "Logout",
                          style: TextStyle(
                          fontSize: fontsize, fontWeight: FontWeight.w600, color: color,),
                ),
                        onTap: () {
                          logOut();
                        }),
                  ),
                ),
              ],
            );
          })),
        ),
      ),
    );
  }

  void logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 1),
        backgroundColor: Colors.redAccent,
        content: Text("Logout Succesfull")));
    // Navigator.of(context)
    //     .popUntil(ModalRoute.withName(Navigator.defaultRouteName));
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) => LoginScreen(),
      ),
      (Route route) => false,
    );
  }
}
