import 'package:education_app_opine/Screens/loginscreen.dart';
import 'package:flutter/material.dart';

 class PasswordResetSuccessScreen extends StatefulWidget {
   const PasswordResetSuccessScreen({Key? key}) : super(key: key);

   @override
   State<PasswordResetSuccessScreen> createState() => _PasswordResetSuccessScreenState();
 }

 class _PasswordResetSuccessScreenState extends State<PasswordResetSuccessScreen> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       body: Stack(
         children: [
           Container(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
             child: Image.asset('lib/Assets/background/success.png',fit: BoxFit.cover,),
           ),
           Center(
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Image.asset('lib/Assets/background/success-bg.png',
                   width: 160.0,
                   height: 116.0,),
                 SizedBox(height: 33.0,),
                 Text('Success',
                 style: TextStyle(
                   fontSize: 20.0,
                   fontWeight: FontWeight.w700,
                   color: Color(0xFF1CC700),
                 ),),
                 SizedBox(height: 33.0,),
                 Text('Your password has been changed ',
                   style: TextStyle(
                     fontSize: 16.0,
                     fontWeight: FontWeight.w600,
                     color: Color(0xFF898989),
                   ),),
               ],
             ),
           ),
           Container(
             alignment: Alignment.bottomCenter,
             padding: EdgeInsets.all(48.0),
             child: ElevatedButton(
               onPressed: () {
                 Navigator.of(context).pushReplacement(MaterialPageRoute(
                     builder: (BuildContext context) => LoginScreen()));

               },
               child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: const [
                     Text(
                       "Login now",
                       style: TextStyle(
                           fontWeight: FontWeight.w700,
                           fontSize: 14,
                           color: Colors.white),
                     ),
                   ]),
               style: ElevatedButton.styleFrom(
                 elevation: 0,
                 primary: Color(0xFF7C99FF),
                 fixedSize: Size(400, 55),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10),
                   // side: BorderSide(color: Colors.black.withOpacity(.3)),
                 ),
               ),
             ),
           )
         ],
       )
     );
   }
 }
