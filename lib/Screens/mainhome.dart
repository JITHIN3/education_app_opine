import 'package:education_app_opine/Screens/FeePayment/fee_payment.dart';
import 'package:education_app_opine/Screens/FeePayment/feespage1.dart';
import 'package:education_app_opine/Screens/chat/allchat.dart';
import 'package:education_app_opine/Screens/chat/personalchatscreen.dart';
import 'package:education_app_opine/Screens/loginscreen.dart';
import 'package:education_app_opine/Screens/dashboard.dart';
import 'package:education_app_opine/Screens/noticeboard/noticeboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late TabController controller;
  int _bottomNavIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  pageCaller(int index) {
    switch (index) {
      case 0:
        {
          return const DashScreen();
        }
      case 1:
        {
          // return const FeePage1();
          return const FeePaymentScreen();

        }

      case 2:
        {
          return NoticeBoardScreen();
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
                  Text("Coming Soon",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),)
                ],
              ),)));
        }
      case 4:
        {
          return const  AdminMessageScreen();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onAlertDialoge(context),
      child: Scaffold(
        body: SafeArea(child: pageCaller(_bottomNavIndex)),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            controller: controller,
            indicator: TopIndicator(),
            indicatorSize: TabBarIndicatorSize.label,
            onTap: (index) => setState(() {
              _bottomNavIndex = index;
            }),
            labelColor: Colors.black,
            labelStyle: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.w500
            ),
            unselectedLabelColor: Colors.grey,
            unselectedLabelStyle: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.w500
            ),

            tabs: <Widget>[
              Tab(
                icon: Image.asset(_bottomNavIndex == 0?'lib/Assets/menu/home-d.png':'lib/Assets/menu/home.png',
                  height: 29.0,
                  semanticLabel: 'Home',
                ),
                text: 'Home',
              ),
              Tab(
                  icon: Image.asset(_bottomNavIndex == 1?'lib/Assets/menu/pay-d.png':'lib/Assets/menu/pay.png',
                    height: 29.0,
                    semanticLabel: 'payment',
                  ),
                  text: 'Fee payment'),
              Tab(
                  icon: Image.asset(_bottomNavIndex == 2?'lib/Assets/menu/notice-d.png':'lib/Assets/menu/notice.png',
                    height: 29.0,
                    semanticLabel: 'Noticeboard',
                  ),
                  text: 'Noticeboard'),
              Tab(
                  icon: Image.asset(_bottomNavIndex == 3?'lib/Assets/menu/timetable-d.png':'lib/Assets/menu/timetable.png',
                    height: 29.0,
                    semanticLabel: 'Time table',
                  ),
                  text: 'Time table'),
              Tab(
                  icon: Image.asset(_bottomNavIndex == 4?'lib/Assets/menu/message-d.png':'lib/Assets/menu/message.png',
                    height: 29.0,
                    semanticLabel: 'Messages',
                  ),
                  text: 'Messages'),
            ],
          ),
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
class TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;


    canvas.drawLine(offset, Offset(cfg.size!.width + offset.dx,0), paint);
  }
}