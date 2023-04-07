import 'package:education_app_opine/Apis/Apidata.dart';
import 'package:education_app_opine/ConstantWidget/query/screensize.dart';
import 'package:education_app_opine/Preferaneces/preferances.dart';
import 'package:education_app_opine/Screens/forget_password.dart';
import 'package:education_app_opine/Screens/mainhome.dart';
import 'package:education_app_opine/Models/loginmodel.dart';
import 'package:education_app_opine/Screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginModel loginModel;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('lib/Assets/background/login.png',fit: BoxFit.cover,),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 32.0,right: 32.0,top: 100,bottom: 32.0),
              child:Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2648BD)
                          ),
                        ),
                        // SizedBox(height: 2,),
                        Text(
                          'Login to continue',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFD7D6DE)
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.0,),
                  Image.asset('lib/Assets/background/login-bg.png',
                  width: 149.0,
                  height: 112.0,),
                  SizedBox(height: 37.0,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'E-Mail',
                            style:TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF898989)
                            )
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //     borderSide: const BorderSide(color: Color(0xFFE6E6E6))),
                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(10),
                              // ),
                              hintText: "yournameexample@mail",
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.03,
                            color: Color(0xFFCFCBCB)
                          )),
                          controller: usernameController,
                          onSaved: (input) => loginModel.data = input as Data?,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 34.0,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Password',
                            style:TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF898989)
                            )
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //     borderSide: const BorderSide(color: Color(0xFFE6E6E6))),
                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(10),
                              // ),
                              hintText: "yourpassword",
                              hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.03,
                                  color: Color(0xFFCFCBCB)
                              )),
                          controller: passwordController,
                          onSaved: (input) => loginModel.data = input as Data?,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 52.0,),
                 ElevatedButton(
                    onPressed: () {
                      if (usernameController.text.length > 0) {
                        if (passwordController.text.length > 0) {
                          login(usernameController.text, passwordController.text);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                duration: Duration(seconds: 1),
                                backgroundColor: Colors.blueAccent,
                                content: Text("Enter Password")),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              duration: Duration(seconds: 1),
                              backgroundColor: Colors.blueAccent,
                              content: Text("Enter Username")),
                        );
                      }
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Log In ",
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
                ],
              )
            ),
          ),
          Container(
            padding: EdgeInsets.all(32.0).copyWith(bottom: 50),
            alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Having trouble with sign in?',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF898989)
                  ),),
                  SizedBox(height: 15.0,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) => ForgotPasswordScreen()));
                    },
                    child: Text('Forgot password?',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF494949)
                        )),
                  )
                ],
              ))
        ],
      ),
resizeToAvoidBottomInset: false,
      // SingleChildScrollView(
      //   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //     const Padding(
      //       padding: EdgeInsets.all(20),
      //       child: Text(
      //         "Welcome\nBack",
      //         style: TextStyle(fontSize: 25),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
      //       child: TextFormField(
      //         decoration: InputDecoration(
      //             enabledBorder: OutlineInputBorder(
      //                 borderSide: const BorderSide(color: Colors.grey),
      //                 borderRadius: BorderRadius.circular(10)),
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //             hintText: "Username"),
      //         controller: usernameController,
      //         onSaved: (input) => loginModel.data = input as Data?,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
      //       child: TextFormField(
      //         obscureText: true,
      //         decoration: InputDecoration(
      //             enabledBorder: OutlineInputBorder(
      //                 borderSide: const BorderSide(color: Colors.grey),
      //                 borderRadius: BorderRadius.circular(10)),
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //             hintText: "Password"),
      //         controller: passwordController,
      //         onSaved: (input) => loginModel.data = input as Data?,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
      //       child: Center(
      //         child: ElevatedButton(
      //           onPressed: () {
      //             if (usernameController.text.length > 0) {
      //               if (passwordController.text.length > 0) {
      //                 login(usernameController.text, passwordController.text);
      //               } else {
      //                 ScaffoldMessenger.of(context).showSnackBar(
      //                   SnackBar(
      //                       duration: Duration(seconds: 1),
      //                       backgroundColor: Colors.blueAccent,
      //                       content: Text("Enter Password")),
      //                 );
      //               }
      //             } else {
      //               ScaffoldMessenger.of(context).showSnackBar(
      //                 SnackBar(
      //                     duration: Duration(seconds: 1),
      //                     backgroundColor: Colors.blueAccent,
      //                     content: Text("Enter Username")),
      //               );
      //             }
      //           },
      //           child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: const [
      //                 Text(
      //                   "Login ",
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.w500,
      //                       fontSize: 16,
      //                       color: Colors.white),
      //                 ),
      //               ]),
      //           style: ElevatedButton.styleFrom(
      //             elevation: 0,
      //             primary: Colors.blue,
      //             fixedSize: Size(400, 55),
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10),
      //               // side: BorderSide(color: Colors.black.withOpacity(.3)),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     const Center(
      //       child: Padding(
      //         padding: EdgeInsets.only(top: 20),
      //         child: Text(
      //           "Forgot Password?",
      //           style: TextStyle(fontSize: 15),
      //         ),
      //       ),
      //     ),
      //     // const SizedBox(height: 160),
      //     // const Center(
      //     //   child: Text(
      //     //     "Or Login with",
      //     //     style: TextStyle(fontSize: 15),
      //     //   ),
      //     // ),
      //     // Row(
      //     //   mainAxisAlignment: MainAxisAlignment.center,
      //     //   children: [
      //     //     Column(
      //     //       children: const [
      //     //         Padding(
      //     //           padding: EdgeInsets.only(top: 20),
      //     //           child: CircleAvatar(
      //     //             radius: 30,
      //     //             backgroundColor: Colors.blue,
      //     //             child: ClipRRect(
      //     //               child: Image(
      //     //                 image: AssetImage("lib/Assets/facebook.png"),
      //     //                 width: 20,
      //     //               ),
      //     //             ),
      //     //           ),
      //     //         ),
      //     //         Padding(
      //     //           padding: EdgeInsets.only(top: 10),
      //     //           child: Text("Facebook"),
      //     //         )
      //     //       ],
      //     //     ),
      //     //     Column(
      //     //       children: const [
      //     //         Padding(
      //     //           padding: EdgeInsets.only(top: 20, left: 30),
      //     //           child: CircleAvatar(
      //     //             radius: 30,
      //     //             child: ClipRRect(
      //     //               child: Image(
      //     //                 image: NetworkImage(
      //     //                     "https://cdn-icons-png.flaticon.com/512/2702/2702602.png"),
      //     //                 width: 20,
      //     //               ),
      //     //             ),
      //     //           ),
      //     //         ),
      //     //         Padding(
      //     //           padding: EdgeInsets.only(top: 10, left: 27),
      //     //           child: Text("Google"),
      //     //         )
      //     //       ],
      //     //     ),
      //     //     Column(
      //     //       children: const [
      //     //         Padding(
      //     //           padding: EdgeInsets.only(top: 20, left: 30),
      //     //           child: CircleAvatar(
      //     //             radius: 30,
      //     //             backgroundColor: Colors.black,
      //     //             child: ClipRRect(
      //     //               child: Image(
      //     //                 image: AssetImage("lib/Assets/apple.png"),
      //     //                 width: 20,
      //     //               ),
      //     //             ),
      //     //           ),
      //     //         ),
      //     //         Padding(
      //     //           padding: EdgeInsets.only(top: 10, left: 25),
      //     //           child: Text("Apple"),
      //     //         )
      //     //       ],
      //     //     ),
      //     //   ],
      //     // ),
      //     // Row(
      //     //   mainAxisAlignment: MainAxisAlignment.center,
      //     //   children: const [
      //     //     Padding(
      //     //       padding: EdgeInsets.only(top: 40),
      //     //       child: Text("New User ?", style: TextStyle(fontSize: 17)),
      //     //     ),
      //     //     Padding(
      //     //       padding: EdgeInsets.only(top: 40, left: 8),
      //     //       child: Text("Sign up",
      //     //           style: TextStyle(fontSize: 17, color: Colors.blue)),
      //     //     )
      //     //   ],
      //     // )
      //   ]),
      // ),
    );
  }

  Future<void> login(String username, String password) async {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      var response = await http.post(Uri.parse(ApiData.Login), headers: {
        "Cookie":
            "ci_session=a%3A5%3A%7Bs%3A10%3A%22session_id%22%3Bs%3A32%3A%2211a9eb185b25ef9ab87f18ce3674e9d6%22%3Bs%3A10%3A%22ip_address%22%3Bs%3A7%3A%220.0.0.0%22%3Bs%3A10%3A%22user_agent%22%3Bs%3A21%3A%22PostmanRuntime%2F7.28.4%22%3Bs%3A13%3A%22last_activity%22%3Bi%3A1656405618%3Bs%3A9%3A%22user_data%22%3Bs%3A0%3A%22%22%3B%7D55754149e7f725d873417681a1f3692d",
      }, body: {
        "username": username,
        "password": password,
      });

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        final resdata = data['data'];
        final tokendata = resdata['token'];
        print("resdata: $resdata");
        print("tokendata: ${resdata['token']}");

        Preferances().saveToken(tokendata);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(seconds: 1),
            backgroundColor: Colors.green,
            content: Text("Login Successfully")));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        print(response.body.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              duration: Duration(seconds: 1),
              backgroundColor: Colors.red,
              content: Text("Incorrect Username/Password")),
        );
      }
      return data;
    }
  }
}
