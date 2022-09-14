import 'dart:convert';
import 'package:education_app_opine/Models/EventListModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:education_app_opine/Apis/Apidata.dart';
import 'package:education_app_opine/Preferaneces/preferances.dart';

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
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  List<CalendarModel>? holiday = [];
  List<DateTime> holidayList = [];
  List<DateTime> eventsList = [];
  int eventsListIndex=-1;
  List<DateTime> events = [];

  List<EventModel> calendarevent = [];

  @override
  void initState() {
    getCalendar();
    getEvents(selectedDay.toString().split(" ")[0]);
    super.initState();
  }

  bool isLoading = false;
  bool isSessionLoad = false;

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
                              locale: 'en_US',
                              focusedDay: focusedDay,
                              currentDay: selectedDay,
                              firstDay: DateTime(1990),
                              lastDay: DateTime(2050),
                              calendarFormat: format,
                              onPageChanged: (focusDay) {
                                focusedDay = focusDay;
                              },
                              daysOfWeekVisible: true,
                              selectedDayPredicate: (day) {
                                DateTime parsedDate =
                                new DateFormat("yyyy-MM-dd")
                                    .parse(day.toString());
                                return eventsList.contains(parsedDate);
                              },
                              onDaySelected: (selectDay, focusDay) {
                                print(selectDay);
                                setState(() {
                                  getEvents(selectDay.toString().split(" ")[0]);
                                  // calendarevent;
                                  selectedDay = selectDay;
                                });
                              },
                              holidayPredicate: (day) {
                                DateTime parsedDate =
                                    new DateFormat("yyyy-MM-dd")
                                        .parse(day.toString());
                                return holidayList.contains(parsedDate);
                              },

                              calendarStyle: CalendarStyle(
                                holidayTextStyle: TextStyle(color: Colors.red),
                                holidayDecoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                isTodayHighlighted: true,
                                selectedDecoration: BoxDecoration(
                                    color: Colors.white, shape: BoxShape.circle),
                                selectedTextStyle:
                                    TextStyle(color: Colors.green),
                              ),
                              headerStyle: const HeaderStyle(
                                  formatButtonVisible: false,
                                  titleCentered: true,
                                  titleTextStyle: TextStyle(fontSize: 18)),
                              startingDayOfWeek: StartingDayOfWeek.sunday,

                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(
                                "Events",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue),
                              )),
                          null != calendarevent && calendarevent.length > 0
                              ? ListView.builder(
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: calendarevent.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white),
                                        child: ListTile(
                                          title: Text(
                                            calendarevent[index]
                                                .reason
                                                .toString(),
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                              : Center(
                                  child: Text("No Events Available"),
                                )
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
    isLoading = true;
    setState(() {});

    Preferances().getToken().then((value) async {
      var response =
          await http.post(Uri.parse(ApiData.Calendar_List), body: value);
      final responsebody = json.decode(response.body.toString());
      isLoading = false;
      setState(() {});
      if (responsebody["status"] == 200) {
        final data = responsebody['data'];

        List holidayDays = data['holiday_list'];
        // response = jsonDecode(responsebody);
        List eventList = data['event_list'];
        if (null != holidayDays && holidayDays.length > 0) {
          for (Map<String, dynamic> day in holidayDays) {
            String? convertedDate =
                "${day["year"]}-${day["mon"].padLeft(2, '0')}-${day["day"].padLeft(2, '0')}";
            DateTime parsedDate =
                new DateFormat("yyyy-MM-dd").parse(convertedDate);
            holidayList.add(parsedDate);
          }
        }
        if (null != eventList && eventList.length > 0) {
          for (Map<String, dynamic> day in eventList) {
            String? convertedDate =
                "${day["year"]}-${day["mon"].padLeft(2, '0')}-${day["day"].padLeft(2, '0')}";
            DateTime parsedDate =
            new DateFormat("yyyy-MM-dd").parse(convertedDate);
            eventsList.add(parsedDate);
          }
        }
      }
      setState(() {});
    });
  }

  getEvents(String date) async {
    isLoading = true;
    events = [];
    setState(() {});
    Preferances().getToken().then((value) async {
      var response = await http.post(Uri.parse(ApiData.Event_List),
          body: {"Authorization": value["Authorization"], "date": date});
      final responsebody = json.decode(response.body.toString());

      isLoading = false;

      if (responsebody['status'] == 200) {
        final data = responsebody['data'];
        List eventList = data["event_list"];
        if (null != eventList && eventList.length > 0) {
          calendarevent = eventList
              .map((spacecraft) => new EventModel.fromJson(spacecraft))
              .toList();
        } else {
          setState(() {
            calendarevent = [];
          });
        }
      }
      setState(() {});
    });
  }
}
