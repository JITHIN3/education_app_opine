import 'dart:convert';

import 'package:education_app_opine/Apis/Apidata.dart';
import 'package:education_app_opine/ConstantWidget/query/screensize.dart';
import 'package:education_app_opine/Models/AttendanceModal.dart';
import 'package:education_app_opine/Preferaneces/preferances.dart';
import 'package:education_app_opine/Screens/NotificationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:http/http.dart' as http;
class StudentsAttandece extends StatefulWidget {
  const StudentsAttandece({Key? key}) : super(key: key);

  @override
  State<StudentsAttandece> createState() => _StudentsAttandeceState();
}

class _StudentsAttandeceState extends State<StudentsAttandece> {

  bool isLoading = false;
  AttendanceDataModal attendanceDataModal = new AttendanceDataModal();
   List<MonthList> tableList = [];
  double attendacePercentage = 0;
  @override
  void initState() {
    // TODO: implement initState
    getAttendanceDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return isLoading?Scaffold(
      body: Center(child: CircularProgressIndicator(color: Color(0xFF6867FF)),),
    )
        :
    Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xFFF8F8F8),
            title: Text('Attendance'),
            titleTextStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.black),
            centerTitle: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: InkWell(
                    child: Icon(
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
                    }),
              ),
            ]),
        body: Column(
          children: [
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: CircularPercentIndicator(
                  arcType: ArcType.FULL,
                  radius: 100.0,
                  animation: true,
                  lineWidth: 30.0,
                  // restartAnimation: true,
                  percent: attendacePercentage,
                  center: new Text(
                    "${attendanceDataModal.attendanceInfo?.attendancePercentage}%",
                    style: TextStyle(fontSize: 20),
                  ),
                  arcBackgroundColor: Color(0xFFFFD572),
                  progressColor: Color(0xFFB09FFF),
                  circularStrokeCap: CircularStrokeCap.round,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: 111.0,
                decoration: BoxDecoration(
                  color: Color(0xFF7C99FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total Days',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${attendanceDataModal.attendanceInfo?.totalWorkingDays} Days',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Present Days',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${attendanceDataModal.attendanceInfo?.totalPresentDays} Days',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                    Positioned(
                      top: -18,
                      left: MediaQuery.of(context).size.width * .4,
                      width: 36,
                      height: 36,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          // borderRadius:  BorderRadius.all(
                          //   Radius.circular(50),
                          // ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -18,
                      left: MediaQuery.of(context).size.width * .4,
                      width: 36,
                      height: 36,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          // borderRadius:  BorderRadius.all(
                          //   Radius.circular(50),
                          // ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          headingRowHeight: 30,
                          headingRowColor:
                              MaterialStateProperty.all(Color(0xFFFFFFFF)),
                          columnSpacing: 28,
                          showBottomBorder: true,
                          columns: [
                            DataColumn(
                              label: Text(
                                'Month',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF2648BD)),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Present',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF2648BD)),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Not Present',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF2648BD)),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Total days',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF2648BD)),
                              ),
                            ),
                          ],
                          rows:tableList.map((data) {
                            return DataRow(cells: [
                              DataCell(Text(data.month.toString())),
                              DataCell(Text(data.present.toString())),
                              DataCell(Text(data.notPresnt.toString())),
                              DataCell(Text(data.totalDays.toString())),
                            ]);
                          }).toList(),
                      ),
                    )),
              ),
            )
            // Expanded(
            //     child: Container(
            //   decoration: BoxDecoration(color: Colors.white,
            //     borderRadius: BorderRadius.only(
            //       topRight: Radius.circular(30),
            //       topLeft: Radius.circular(30),
            //     ),
            //   ),
            //   width: Helper.getScreenWidth(context),
            //       child: Padding(
            //         padding: const EdgeInsets.only(top: 30,left: 20,right: 20,bottom: 20),
            //         child: Column(
            //           children: [
            //             ListView.separated(shrinkWrap: true,itemBuilder: (context,index){
            //
            //               return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            //
            //                 Text("January",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
            //                 Text("30/30",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
            //                 Text("100%",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),)
            //               ],);
            //
            //
            //             }, separatorBuilder: (context,index){
            //
            //               return Padding(
            //                 padding: const EdgeInsets.only(top: 10,bottom: 10),
            //                 child: Divider(thickness: 1,),
            //               );
            //             }, itemCount: 5),
            //           ],
            //         ),
            //       ),
            //
            // ),
            // )
          ],
        ));
  }

  Future getAttendanceDetails() async {
    isLoading = true;
    setState(() {});
    Preferances().getToken().then((value) async {
      var response =
      await http.post(Uri.parse(ApiData.FETCH_ATTENDANCE), body: value);
      var responsebody = json.decode(response.body);
      isLoading = false;
      if (responsebody['status'] == 200) {
        final resdata = responsebody['data'];
        attendanceDataModal = AttendanceDataModal.fromJson(resdata);
        String? value = attendanceDataModal.attendanceInfo?.attendancePercentage.toString();
        double? percentage = double.parse(value!);
        attendacePercentage = percentage / 100;
        List dataList = resdata['month_list'];
        tableList = dataList
            .map((spacecraft) => new MonthList.fromJson(spacecraft))
            .toList();
        setState(() {});
      }
    });
  }
}
