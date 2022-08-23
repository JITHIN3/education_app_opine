import 'package:flutter/material.dart';
class StudentData extends StatefulWidget {
   StudentData({Key? key,required this.object,required this.data}) : super(key: key);

  String? object;
  String? data;

  @override
  State<StudentData> createState() => _StudentDataState();
}

class _StudentDataState extends State<StudentData> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

      Text(
        widget.object.toString(),
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
      SizedBox(height: 15),
      Text(
        widget.data.toString(),
        style: TextStyle(fontSize: 16),

      ),
      SizedBox(height: 15),
    ],);
  }
}
