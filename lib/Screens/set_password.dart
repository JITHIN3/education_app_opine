import 'package:education_app_opine/Screens/loginscreen.dart';
import 'package:education_app_opine/Screens/password_reset_success.dart';
import 'package:flutter/material.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('lib/Assets/background/setpass.png',fit: BoxFit.cover,),
          ),
          SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 32.0,right: 32.0,top: 100,bottom: 32.0),
                child:Column(
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
                    SizedBox(height: 58.0,),
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
                            // controller: usernameController,
                            // onSaved: (input) => loginModel.data = input as Data?,
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
                            // controller: usernameController,
                            // onSaved: (input) => loginModel.data = input as Data?,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 52.0,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (BuildContext context) => PasswordResetSuccessScreen()));
                        // if (usernameController.text.length > 0) {
                        //   if (passwordController.text.length > 0) {
                        //     login(usernameController.text, passwordController.text);
                        //   } else {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       SnackBar(
                        //           duration: Duration(seconds: 1),
                        //           backgroundColor: Colors.blueAccent,
                        //           content: Text("Enter Password")),
                        //     );
                        //   }
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //         duration: Duration(seconds: 1),
                        //         backgroundColor: Colors.blueAccent,
                        //         content: Text("Enter Username")),
                        //   );
                        // }
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
              ))
        ],
      ),
    );
  }
}
