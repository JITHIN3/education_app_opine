import 'dart:convert';
import 'dart:developer';

import 'package:education_app_opine/Apis/Apidata.dart';
import 'package:education_app_opine/ConstantWidget/query/screensize.dart';

import 'package:education_app_opine/Models/ShowNotificationModel.dart';
import 'package:education_app_opine/Preferaneces/preferances.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowNotifications extends StatefulWidget {
  const ShowNotifications({Key? key}) : super(key: key);

  @override
  State<ShowNotifications> createState() => _ShowNotificationsState();
}

class _ShowNotificationsState extends State<ShowNotifications> {
  List<NotificationModels> notification = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: .5,
        title: Text("Notifications"),
        centerTitle: true,
      ),
      body:notification.length >0? ListView.builder(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  child: ListTile(subtitle: Padding(
                    padding: const EdgeInsets.only(top:8,bottom: 8),
                    child: Text(notification[index].message.toString()),
                  ),
                    title: Text(
                      notification[index].notificationType.toString(),
                    ),
                  ),
                ));
          },
          itemCount: notification.length):Center(
        child: Text('No notifications'),
      ),
    );
  }

  Future getNotification() async {
    isLoading = true;
    setState(() {});
    Preferances().getToken().then((value) async {
      var response =
          await http.post(Uri.parse(ApiData.Show_Notifications), body: value);
      debugger();

      final responsebody = json.decode(response.body.toString());
      isLoading = false;
      setState(() {});
      if (responsebody['status'] == 200) {
        List dataList = responsebody['data'];
        if (null != dataList && dataList.length > 0) {
          notification = dataList
              .map((spacecraft) => new NotificationModels.fromJson(spacecraft))
              .toList();
        }
      }
      setState(() {});
    });
  }
}
