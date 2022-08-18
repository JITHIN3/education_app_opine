
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



}
