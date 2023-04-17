
import 'dart:convert';

import 'package:education_app_opine/Models/StudenModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferances {

  saveToken(String token) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);

  }

  Future<Map<String, String?>> getToken() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, String?> header= {
      'Authorization':prefs.getString('token'),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    return header;

  }

  setStudentData(String userJson) async {
    SharedPreferences prefs=await SharedPreferences.getInstance();

    prefs.setString('studentJson', userJson);
  }

  Future getStudentData() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String? jsonSting=prefs.getString('studentJson');
    if(null!=jsonSting && jsonSting.isNotEmpty) {
      return StudentDetailModel.fromJson(jsonDecode(jsonSting));
    }else{
      return null;
    }
  }

}
