import 'package:education_app_opine/Screens/NotificationScreen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Profile',style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500
        ),),
        centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: InkWell(
                  child:
                // Image.asset('lib/Assets/background/notification.png',
                  // width: 13.08,
                  // height: 14.45,),
                  Icon(
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
                  }
                  ),
            ),
          ]
      ),
      body: Container(
        color:Color(0xFF2648BD),
        width: 79,
        height: 79,
      )
    );
  }
}
