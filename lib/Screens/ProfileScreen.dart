import 'package:education_app_opine/ConstantWidget/ProfileData.dart';
import 'package:education_app_opine/ConstantWidget/query/screensize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/provider_block.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child:
            Consumer<ApplicationProvider>(builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.blue.shade50,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: InkWell(
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Icon(Icons.arrow_back_rounded,
                                    color: Colors.black, size: 20),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, bottom: 20),
                        child: Container(
                            height: 110,
                            width: 110,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  provider.studentList.imageUrl.toString()),
                            )),
                      ),
                      Text(
                        provider.studentList.name.toString(),
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        provider.studentList.dataClass.toString() +
                            " - " +
                            provider.studentList.division.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    width: Helper.getScreenWidth(context),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40, left: 20),
                      child: ListView(
                        children: [
                          StudentData(
                              object: "Student Id",
                              data: provider.studentList.studentId.toString()),
                          StudentData(
                              object: "Email",
                              data: provider.studentList.email.toString()),
                          StudentData(
                              object: "Phone",
                              data: provider.studentList.mobile.toString()),
                          StudentData(
                              object: "Date of Birth",
                              data: provider.studentList.dob!.day.toString() +
                                  " - " +
                                  provider.studentList.dob!.month.toString() +
                                  " - " +
                                  provider.studentList.dob!.year.toString()),
                          StudentData(
                              object: "Gender",
                              data: provider.studentList.gender.toString()),
                          StudentData(
                              object: "Address",
                              data: provider.studentList.address.toString()),
                          StudentData(
                              object: "Academic Year",
                              data:
                                  provider.studentList.academicYear.toString()),
                          StudentData(
                              object: "Admission No",
                              data:
                                  provider.studentList.admissionNo.toString()),
                          StudentData(
                              object: "Father",
                              data: provider.studentList.father.toString()),
                          StudentData(
                              object: "Father Mobile",
                              data: provider.studentList.fMobile.toString()),
                          StudentData(
                              object: "Mother",
                              data: provider.studentList.mother.toString()),
                          StudentData(
                              object: "Mother Mobile",
                              data: provider.studentList.mMobile.toString()),
                          StudentData(
                              object: "Gardian",
                              data: provider.studentList.guardian.toString()),
                          StudentData(
                              object: "Country",
                              data: provider.studentList.country.toString()),
                          StudentData(
                              object: "State",
                              data: provider.studentList.state.toString()),
                          StudentData(
                              object: "Pin Code",
                              data: provider.studentList.pincode.toString()),
                        ],
                      ),
                    )),
              ),
            ],
          );
        }),
      ),
    );
  }
}
