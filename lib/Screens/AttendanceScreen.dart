import 'package:education_app_opine/ConstantWidget/query/screensize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StudentsAttandece extends StatelessWidget {
  const StudentsAttandece({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: SafeArea(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: CircularPercentIndicator(
                    arcType: ArcType.HALF,
                    radius: 80.0,
                    animation: true,
                    lineWidth: 20.0,
                    restartAnimation: true,
                    percent: .60,
                    center: new Text(
                      "60%",
                      style: TextStyle(fontSize: 20),
                    ),
                    arcBackgroundColor: Colors.grey.shade300,
                    progressColor: Colors.lightBlueAccent,
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                width: Helper.getScreenWidth(context),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30,left: 20,right: 20,bottom: 20),
                      child: Column(
                        children: [
                          ListView.separated(shrinkWrap: true,itemBuilder: (context,index){

                            return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

                              Text("January",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                              Text("30/30",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                              Text("100%",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),)
                            ],);


                          }, separatorBuilder: (context,index){

                            return Padding(
                              padding: const EdgeInsets.only(top: 10,bottom: 10),
                              child: Divider(thickness: 1,),
                            );
                          }, itemCount: 5),
                        ],
                      ),
                    ),

              ),
              )
            ],
          ),
        ));
  }
}
