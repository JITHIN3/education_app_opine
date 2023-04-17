import 'package:education_app_opine/Models/AdminMessageModel.dart';
import 'package:education_app_opine/Models/StudenModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplicationProvider with ChangeNotifier{
 StudentDetailModel studentList=new StudentDetailModel();

  setAllStudentDetails(StudentDetailModel list){
    this.studentList=list;
    notifyListeners();
  }

  AdminChatModel  adminchat = new AdminChatModel();
  setAdminChatDetails(AdminChatModel chatlist){

    this.adminchat=chatlist;
  }


}