import 'dart:convert';

import 'package:education_app_opine/Apis/Apidata.dart';
import 'package:education_app_opine/Screens/loginscreen.dart';
import 'package:education_app_opine/Screens/password_reset_success.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class SetNewPasswordScreen extends StatefulWidget {
  final resData;
  SetNewPasswordScreen(this.resData);

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isWrongPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body:SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset('lib/Assets/background/setpass.png',fit: BoxFit.cover,),
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                // padding: const EdgeInsets.only(left: 32.0,right: 32.0,top: 100,bottom: 32.0),
                padding: const EdgeInsets.all(32.0).copyWith(top: 50),
                child:Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 0,
                      child: Column(
                        children: [
                          Image.asset('lib/Assets/background/setpass-bg.png',
                            width: 144.0,
                            height: 140.0,),
                          SizedBox(height: 27.0,),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Set new password',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF2648BD)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 27.0,),
                        ],
                      ),
                    ),
                    Expanded(
                    flex: 3,
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'New Password',
                                    style:TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF898989)
                                    )
                                ),
                                TextFormField(
                                  controller: newPasswordController,
                                  obscureText: true,
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
                                      hintText: "New Password",
                                      hintStyle: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.03,
                                          color: Color(0xFFCFCBCB)
                                      )),
                                  onChanged: (value){
                                    if(value.isEmpty){
                                      setState(() {
                                        isWrongPassword = false;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 28.0,),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Confirm Password',
                                    style:TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF898989)
                                    )
                                ),
                                TextFormField(
                                  controller: confirmPasswordController,
                                  obscureText: true,
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
                                      hintText: "Confirm Password",
                                      hintStyle: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.03,
                                          color: Color(0xFFCFCBCB)
                                      )),
                                  onChanged: (value){
                                    if(value.isEmpty){
                                      setState(() {
                                        isWrongPassword = false;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),

                          isWrongPassword? Container(
                              margin: EdgeInsets.only(top: 5),
                              alignment: Alignment.centerLeft,
                              child: Text('Password miss match',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.redAccent
                                ),)):Container(),
                          SizedBox(height: 52.0,),
                          ElevatedButton(
                            onPressed: () {

                              _resetPassword(newPasswordController.text, confirmPasswordController.text);
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Confirm",
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
                      ),
                    ),
                    Expanded(
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Get back to login',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF898989)
                                ),),
                              SizedBox(height: 15.0,),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                      builder: (BuildContext context) => LoginScreen()));
                                },
                                child: Text('Login',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF494949)
                                    )),
                              )
                            ],
                          ),
                        ) )

                  ],
                )
            ),

          ],
        ),
      ),
    );
  }
  Future<void> _resetPassword(String newPassword, String confirmPassword) async {
    if(newPassword.isNotEmpty && confirmPassword.isNotEmpty){
      if(newPassword == confirmPassword){
        setState(() {
          isWrongPassword = false;
        });
        var response = await http.post(Uri.parse(ApiData.SET_PASSWORD), body: {
          "id": widget.resData['id'],
          "password":newPassword,
          "confirm_password": confirmPassword
        });
        var data = jsonDecode(response.body);
        if(data['status'] == 200 && data['status_message'] == "Password Set Success fully"){
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => PasswordResetSuccessScreen()));
        }
        if(data['status'] == 200 && data['status_message'] == "Error Occured"){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                duration: Duration(seconds: 5),
                backgroundColor: Colors.red,
                content: Text("An error occured please try again")),
          );
        }
      } else{
        setState(() {
          isWrongPassword = true;
        });
      }
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: Duration(seconds: 5),
            backgroundColor: Colors.red,
            content: Text("Enter your new password")),
      );
    }
  }
}
