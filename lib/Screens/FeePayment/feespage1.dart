import 'dart:convert';

import 'package:education_app_opine/Apis/Apidata.dart';
import 'package:education_app_opine/Screens/FeePayment/feepage2.dart';
import 'package:education_app_opine/Screens/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../Models/payment_history_model.dart';
import '../../Preferaneces/preferances.dart';
import '../../Provider/provider_block.dart';

class FeePage1 extends StatefulWidget {
  const FeePage1({Key? key}) : super(key: key);

  @override
  State<FeePage1> createState() => _FeePage1State();
}

class _FeePage1State extends State<FeePage1> {
  List<PaymentHistoryModel> paymenthistory = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPaymentHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent.withOpacity(.1),
          elevation: 0,
        ),
        body:
            Consumer<ApplicationProvider>(builder: (context, provider, child) {
          return ListView(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: [
                Container(
                  color: Colors.blueAccent.withOpacity(.1),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            "Fee payment",
                            style: TextStyle(fontSize: 23),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Student name",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blueGrey.shade400),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(provider.studentList.name.toString(),
                                      style: TextStyle(fontSize: 18)),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Academic year",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blueGrey.shade400)),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(provider.studentList.academicYear.toString(),
                                    style: TextStyle(fontSize: 18))
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 22),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Admission number",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.blueGrey.shade400),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(provider.studentList.admissionNo.toString(),
                                        style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Class",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.blueGrey.shade400)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(provider.studentList.dataClass.toString()+"  "+provider.studentList.division.toString(), style: TextStyle(fontSize: 18))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 30),
                          child: Container(
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => const FeePage2()));
                              },
                              child: Text(
                                "Pay now",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.blue,
                                fixedSize: Size(130, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  // side: BorderSide(color: Colors.black.withOpacity(.3)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            child: Row(
                              children: [
                                Icon(Icons.history,
                                    size: 20, color: Colors.blueGrey.shade400),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Fee payment history",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blueGrey.shade400),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ]),
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: isLoading
                              ? CircularProgressIndicator()
                              : ListView.builder(
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: paymenthistory.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(
                                          "Paid on  " +
                                              paymenthistory[index]
                                                  .paidDate
                                                  .toString(),
                                          style: TextStyle(fontSize: 17)),
                                      subtitle: Text(
                                        paymenthistory[index]
                                            .feeName
                                            .toString(),
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      trailing: Text(
                                          paymenthistory[index]
                                              .feeAmount
                                              .toString(),
                                          style: TextStyle(fontSize: 15)),
                                      leading: Icon(Icons.check_circle,
                                          size: 30,
                                          color: Colors.green.shade600),
                                    );
                                  }))
                    ],
                  ),
                ))
              ]);
        }));
  }

  Future getPaymentHistory() async {
    isLoading = true;
    setState(() {});
    Preferances().getToken().then((value) async {
      var response = await http.post(Uri.parse(ApiData.Payment_History), body: value);
      final responsebody = json.decode(response.body.toString());

      isLoading = false;
      setState(() {});
      if (responsebody['status'] == 200) {
        List dataList = responsebody['data'];
        if (null != dataList && dataList.length > 0) {
          paymenthistory = dataList
              .map((spacecraft) => new PaymentHistoryModel.fromJson(spacecraft))
              .toList();
          // String data = packageModelList[0].id.toString();
        }
      }
      setState(() {});
    });
  }
}
