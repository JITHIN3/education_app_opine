import 'package:education_app_opine/Provider/provider_block.dart';
import 'package:education_app_opine/Screens/NotificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Profile',style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500
        ),),
        centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: InkWell(
                  child:
                // Image.asset('lib/Assets/background/notification.png',
                  // width: 13.08,
                  // height: 14.45,),
                  Icon(
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
                  }
                  ),
            ),
          ]
      ),
      body: SingleChildScrollView(
        child:  Consumer<ApplicationProvider>(builder: (context, provider, child) {
          return Container(
          padding: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
               children: [
                 DottedBorder(
                   dashPattern: [10, 4],
                   strokeWidth: 2,
                   // borderPadding: EdgeInsets.all(1),
                   color: Color(0xFF2648BD),
                   borderType: BorderType.Circle,
                   child: Container(
                     padding: EdgeInsets.all(3),
                     width: 79,
                     height: 79,
                     decoration: BoxDecoration(
                       color:Colors.white,
                       borderRadius: BorderRadius.circular(50),
                     ),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(50),
                       child: Image.network(provider.studentList.imageUrl.toString(),
                       fit: BoxFit.cover,
                       ),
                     ),
                   ),
                 ),
                 Positioned(
                   bottom: -12,
                   left: 29,
                   child: InkWell(
                     onTap: (){
                       
                     },
                     child: Container(
                       width:30,
                       height: 30,
                       decoration: BoxDecoration(
                           color: Color(0xFF2648BD),
                         borderRadius: BorderRadius.circular(50),
                         border: Border.all(width: 2,color: Colors.white)
                       ),
                       child: Icon(
                         Icons.photo_camera_outlined,color: Colors.white,size: 16,
                       ),
                     ),
                   ),
                 )
               ],
              ),
              SizedBox(height: 20,),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name',
                    style: TextStyle(
                      color: Color(0xFF7D7D7D)
                    ),),
                    SizedBox(height: 6,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 37,vertical: 13),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF6867FF)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(provider.studentList.name.toString(),
                      style: TextStyle(
                        color: Color(0xFF494949)
                      ),)
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('School ID',
                      style: TextStyle(
                          color: Color(0xFF7D7D7D)
                      ),),
                    SizedBox(height: 6,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 37,vertical: 13),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF6867FF)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(provider.studentList.studentId.toString(),
                          style: TextStyle(
                              color: Color(0xFF494949)
                          ),)
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email',
                      style: TextStyle(
                          color: Color(0xFF7D7D7D)
                      ),),
                    SizedBox(height: 6,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 37,vertical: 13),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF6867FF)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(provider.studentList.email.toString(),
                          style: TextStyle(
                              color: Color(0xFF494949)
                          ),)
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone Number',
                      style: TextStyle(
                          color: Color(0xFF7D7D7D)
                      ),),
                    SizedBox(height: 6,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 37,vertical: 13),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF6867FF)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(provider.studentList.mobile.toString(),
                          style: TextStyle(
                              color: Color(0xFF494949)
                          ),)
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('DOB',
                      style: TextStyle(
                          color: Color(0xFF7D7D7D)
                      ),),
                    SizedBox(height: 6,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 37,vertical: 13),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF6867FF)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(provider.studentList.dob!.day.toString() +
                            " - " +
                            provider.studentList.dob!.month.toString() +
                            " - " +
                            provider.studentList.dob!.year.toString(),
                          style: TextStyle(
                              color: Color(0xFF494949)
                          ),)
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Gender',
                      style: TextStyle(
                          color: Color(0xFF7D7D7D)
                      ),),
                    SizedBox(height: 6,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 37,vertical: 13),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF6867FF)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(provider.studentList.gender.toString(),
                          style: TextStyle(
                              color: Color(0xFF494949)
                          ),)
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address',
                      style: TextStyle(
                          color: Color(0xFF7D7D7D)
                      ),),
                    SizedBox(height: 6,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 37,vertical: 13),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF6867FF)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(provider.studentList.address.toString(),
                          style: TextStyle(
                              color: Color(0xFF494949)
                          ),)
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Academic Year',
                      style: TextStyle(
                          color: Color(0xFF7D7D7D)
                      ),),
                    SizedBox(height: 6,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 37,vertical: 13),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF6867FF)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text( provider.studentList.academicYear.toString(),
                          style: TextStyle(
                              color: Color(0xFF494949)
                          ),)
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Admission Number',
                      style: TextStyle(
                          color: Color(0xFF7D7D7D)
                      ),),
                    SizedBox(height: 6,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 37,vertical: 13),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF6867FF)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(provider.studentList.admissionNo.toString(),
                          style: TextStyle(
                              color: Color(0xFF494949)
                          ),)
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Father',
                      style: TextStyle(
                          color: Color(0xFF7D7D7D)
                      ),),
                    SizedBox(height: 6,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 37,vertical: 13),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF6867FF)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(provider.studentList.father.toString(),
                          style: TextStyle(
                              color: Color(0xFF494949)
                          ),)
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Father Mobile',
                      style: TextStyle(
                          color: Color(0xFF7D7D7D)
                      ),),
                    SizedBox(height: 6,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 37,vertical: 13),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF6867FF)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(provider.studentList.fMobile.toString(),
                          style: TextStyle(
                              color: Color(0xFF494949)
                          ),)
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mother',
                      style: TextStyle(
                          color: Color(0xFF7D7D7D)
                      ),),
                    SizedBox(height: 6,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 37,vertical: 13),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF6867FF)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(provider.studentList.mother.toString(),
                          style: TextStyle(
                              color: Color(0xFF494949)
                          ),)
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mother Mobile',
                      style: TextStyle(
                          color: Color(0xFF7D7D7D)
                      ),),
                    SizedBox(height: 6,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 37,vertical: 13),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF6867FF)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(provider.studentList.mMobile.toString(),
                          style: TextStyle(
                              color: Color(0xFF494949)
                          ),)
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Guardian',
                      style: TextStyle(
                          color: Color(0xFF7D7D7D)
                      ),),
                    SizedBox(height: 6,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 37,vertical: 13),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF6867FF)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(provider.studentList.guardian.toString(),
                          style: TextStyle(
                              color: Color(0xFF494949)
                          ),)
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Country',
                      style: TextStyle(
                          color: Color(0xFF7D7D7D)
                      ),),
                    SizedBox(height: 6,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 37,vertical: 13),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF6867FF)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(provider.studentList.country.toString(),
                          style: TextStyle(
                              color: Color(0xFF494949)
                          ),)
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('State',
                      style: TextStyle(
                          color: Color(0xFF7D7D7D)
                      ),),
                    SizedBox(height: 6,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 37,vertical: 13),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF6867FF)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(provider.studentList.state.toString(),
                          style: TextStyle(
                              color: Color(0xFF494949)
                          ),)
                    )
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pincode',
                      style: TextStyle(
                          color: Color(0xFF7D7D7D)
                      ),),
                    SizedBox(height: 6,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 37,vertical: 13),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF6867FF)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(provider.studentList.pincode.toString(),
                          style: TextStyle(
                              color: Color(0xFF494949)
                          ),)
                    )
                  ],
                ),
              ),
            ],
          ),
        );
        }),
      )
    );
  }
}
