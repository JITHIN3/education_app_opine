import 'dart:async';

import 'package:education_app_opine/Preferaneces/preferances.dart';
import 'package:education_app_opine/Provider/provider_block.dart';
import 'package:education_app_opine/Screens/chat/personalchatscreen.dart';
import 'package:education_app_opine/Screens/mainhome.dart';
import 'package:education_app_opine/Screens/calanderscreen.dart';
import 'package:education_app_opine/Screens/chat/allchat.dart';
import 'package:education_app_opine/Screens/dashboard.dart';
import 'package:education_app_opine/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Models/loginmodel.dart';
import 'Screens/loginscreen.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ApplicationProvider>(
            create: (context) => ApplicationProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          home: SignInDemo())));
}



// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.grey,
//       ),
//     home:SignInDemo());
//   }
// }

class SignInDemo extends StatefulWidget {
  @override
  State createState() => SignInDemoState();
}

class SignInDemoState extends State<SignInDemo>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;
  var _visible = true;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    Preferances().getToken().then((value) {
      if (null != value["Authorization"] &&
          value['Authorization']!.isNotEmpty) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 4),
    );
    animation = new CurvedAnimation(
        parent: animationController!, curve: Curves.bounceIn);

    animation!.addListener(() => this.setState(() {}));
    animationController!.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ClipRRect(
          child: Image(
            width: 130,
            image: AssetImage("lib/Assets/erplogo-removebg-preview.png"),
          ),
        ),
      ),
    );
  }
}
