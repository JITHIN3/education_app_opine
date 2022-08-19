import 'package:education_app_opine/Screens/FeePayment/feespage1.dart';
import 'package:education_app_opine/Screens/chat/allchat.dart';
import 'package:education_app_opine/Screens/chat/personalchatscreen.dart';
import 'package:education_app_opine/Screens/loginscreen.dart';
import 'package:education_app_opine/Screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  int _bottomNavIndex = 0;

  void _onItemTapped(int index) {
    if (index != 4) {
      setState(() {
        _bottomNavIndex = index;
      });

      print(_bottomNavIndex);
    } else if (index == 4) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>const  AdminMessageScreen()),
      );
    }
  }

  pageCaller(int index) {
    switch (index) {
      case 0:
        {
          return const DashScreen();
        }
      case 1:
        {
          return const FeePage1();
        }

      case 2:
        {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.insert_drive_file_rounded,
                      color: Colors.grey,
                      size: 100,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Noticeboard",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
            ),
          );
        }
      case 3:
        {
          return Scaffold(
              body: SafeArea(child: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.perm_contact_cal,
                    color: Colors.grey,
                    size: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Timetable",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),)
                ],
              ),)));
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onAlertDialoge(context),
      child: Scaffold(
        body: SafeArea(child: pageCaller(_bottomNavIndex)),
        bottomNavigationBar: CustomLineIndicatorBottomNavbar(
          currentIndex: _bottomNavIndex,
          unSelectedColor: Colors.grey,
          backgroundColor: Colors.white,
          lineIndicatorWidth: 3,
          indicatorType: IndicatorType.Top,
          onTap: _onItemTapped,
          customBottomBarItems: [
            CustomBottomBarItems(icon: Icons.home, label: "Home"),
            CustomBottomBarItems(icon: Icons.payment_rounded, label: "Fee"),
            CustomBottomBarItems(
                icon: Icons.filter_frames_rounded, label: "Noticeboard"),
            CustomBottomBarItems(
                icon: Icons.perm_contact_calendar_rounded, label: "Timetable"),
            CustomBottomBarItems(icon: Icons.message, label: "Message"),
          ],
          selectedColor: Colors.black,
          unselectedIconSize: 25,
          selectedIconSize: 27,
        ),
      ),
    );
  }

  Future<bool> onAlertDialoge(BuildContext context) async {
    setState(() {});
    bool exitapp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Really"),
            content: Text("Do you want close this app?"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "No",
                    style: TextStyle(color: Colors.blue),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child:
                      Text("Yes", style: TextStyle(color: Colors.redAccent))),
            ],
          );
        });

    return exitapp;
  }
}
