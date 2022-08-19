import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:education_app_opine/Apis/Apidata.dart';
import 'package:education_app_opine/Preferaneces/preferances.dart';
import 'package:education_app_opine/Screens/mainhome.dart';
import 'package:education_app_opine/ConstantWidget/events.dart';

import 'package:http/http.dart' as http;
import 'package:table_calendar/table_calendar.dart';

import '../ConstantWidget/query/screensize.dart';
import '../Models/calandermodel.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  List<CalendarModel>? holiday  = [];
  List<DateTime> holidayList = [];



  @override
  void initState() {
    getCalendar();
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];

  }

  bool isLoading = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Calendar"),
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30, top: 30),

          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      color: Colors.blueGrey.shade50),
                  width: Helper.getScreenWidth(context),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TableCalendar(

                              focusedDay: selectedDay,
                              firstDay: DateTime(1990),
                              lastDay: DateTime(2050),


                              calendarFormat: format,
                              daysOfWeekVisible: true,
                              onDaySelected:
                                  (DateTime selectDay, DateTime focusDay) {
                                setState(() {
                                  selectedDay = selectDay;
                                  focusedDay = focusDay;
                                });
                              },
                              holidayPredicate: (day){
                                DateTime parsedDate = new DateFormat("yyyy-MM-dd")
                                    .parse(day.toString());
                                return holidayList.contains(parsedDate);
                              },
                              eventLoader: _getEventsfromDay,
                              calendarStyle: const CalendarStyle(
                                holidayTextStyle:
                                    TextStyle(color: Colors.red),
                                holidayDecoration: BoxDecoration(
                                  color: Colors.white,
                                      shape:BoxShape.circle
                                ),
                                isTodayHighlighted: true,
                                selectedDecoration: BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
                                selectedTextStyle:
                                    TextStyle(color: Colors.white),
                              ),
                              headerStyle: const HeaderStyle(
                                  formatButtonVisible: false,
                                  titleCentered: true,
                                  titleTextStyle: TextStyle(fontSize: 18)),
                              selectedDayPredicate: (DateTime date) {
                                return isSameDay(selectedDay, date);
                              },
                              startingDayOfWeek: StartingDayOfWeek.sunday,
                              onFormatChanged: (CalendarFormat _format) {
                                setState(() {
                                  format = _format;
                                });
                              },
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Events",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: ListTile(
                                  title: const Text("Maths Class"),
                                  subtitle: const Text("10:00 AM"),
                                  trailing: Text(
                                    selectedDay.day.toString() +
                                        "/" +
                                        selectedDay.month.toString() +
                                        "/" +
                                        selectedDay.year.toString(),
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,

    );
  }

getCalendar() async {

    isLoading =true;
    setState(() {});

    Preferances().getToken().then((value) async {

      var response = await http.post(Uri.parse(ApiData.Calendar_List),body: value);
      final responsebody = json.decode(response.body.toString());
      isLoading =false;
      setState(() {});
      if(responsebody["status"]==200){
        final data = responsebody['data'];
        List holidayDays = data['holiday_list'];
       // response = jsonDecode(responsebody);
        if (null != holidayDays && holidayDays.length > 0) {
          for (Map<String, dynamic> day in holidayDays) {

            String? convertedDate = "${day["year"]}-${day["mon"].padLeft(2,'0')}-${day["day"].padLeft(2,'0')}";
            DateTime parsedDate = new DateFormat("yyyy-MM-dd").parse(convertedDate);
            holidayList.add(parsedDate);



          }
        }
        // List dataList =responsebody['data'];
        // if(null !=dataList && dataList.length > 0){
        //   holiday = dataList.map((spacecraft) => new CalendarModel.fromJson(spacecraft)).toList();
        //
        // }
      }
      setState(() {

      });
    });




  }
}





