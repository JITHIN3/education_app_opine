import 'dart:convert';

import 'package:education_app_opine/Screens/mainhome.dart';
import 'package:education_app_opine/ConstantWidget/events.dart';
import 'package:flutter/material.dart';
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
  List<Data>? holiday  = [];
  final Map<DateTime, List> holidays = {
    DateTime(2021, 3, 1): ["228"],
  };


  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }


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
                              eventLoader: _getEventsfromDay,
                              calendarStyle: const CalendarStyle(
                                holidayTextStyle:
                                    TextStyle(color: Colors.redAccent),
                                holidayDecoration: BoxDecoration(),
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

  Future<Data?> getCalendar(day,index) async {
    final response = await http.post(

        Uri.parse(
            "https://educationerp.in/bhavans/index.php/m_api/attendance_c/calender_list"),
        body: {
          "Authorization":
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpbl9kYXRhIjp7InN0dWRlbnRfaWQiOiIzNDAzIiwic3R1ZGVudF9uYW1lIjoiVGVzdCAgVCIsImFkbWlzc2lvbl9ubyI6Ijk5OTk5OSIsImNsYXNzIjoiVGVzdCIsImRpdmlzaW9uIjpudWxsLCJ1c2VybmFtZSI6Ijk5OTk5OSIsInJvbGUiOiI0Iiwicm9sZV9uYW1lIjoiUGFyZW50In19.-b5VVJINJXs0CJ2SX0h5hEN8JDQ9PFSXvvPgCcbv--0",
        });

    final jsonData = jsonDecode(response.body);
    var data = CalendarModel.fromJson(jsonData).data;
    return data;
  }
  Future <DateTime> getholiday()async{

         var day =DateTime(2022,07,07);
         return day;

  }
}





