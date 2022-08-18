// import 'dart:convert';
//
// import 'package:education_app_opine/Apis/Apidata.dart';
// import 'package:education_app_opine/Models/AdminMessageModel.dart';
// import 'package:education_app_opine/Preferaneces/preferances.dart';
// import 'package:education_app_opine/Screens/chat/personalchatscreen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// class AllChatScreen extends StatefulWidget {
//
//   @override
//   AllChatScreenState createState() => AllChatScreenState();
// }
//
// class AllChatScreenState extends State<AllChatScreen> {
//   bool isLoading = false;
//   List <AdminChatModel>listallchat=[];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     getAllChat();
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // leading: Container(
//         //   margin: EdgeInsets.only(left:15),
//         //   child: GestureDetector(
//         //     child: CircleAvatar(
//         //       backgroundColor: Colors.white,
//         //       child: Icon(
//         //         Icons.arrow_back,
//         //         color: Color(0xff0C305A),
//         //         size: 25,
//         //       ),
//         //     ),
//         //   ),
//         //   alignment: Alignment.center,
//         //   height: 30,
//         // ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Color(0xffF1F4F8),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Messages",
//               style: TextStyle(color: Color(0xff0C305A)),
//             ),
//             // GestureDetector(
//             //   child: Icon(Icons.add,
//             //   color: Colors.blue,),
//             //   onTap: (){
//             //     Navigator.of(context,rootNavigator: true).push(
//             //         MaterialPageRoute(
//             //             builder:
//             //                 (BuildContext context) =>
//             //                 ChatScreen(widget.studentModel,dashboardModel)));
//             //   },
//             // ),
//           ],
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: Color(0xffF1F4F8),
//         ),
//         child: SafeArea(
//           child:isLoading?CircularProgressIndicator(): Container(
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(40),
//                   topLeft: Radius.circular(40),
//                 ),
//               ),
//               // color: Colors.white,
//               child:
//                   Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child:ListView.builder(
//                     scrollDirection: Axis.vertical,
//                     itemCount: listallchat.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return GestureDetector(
//                         child: Card(
//                           elevation: 0,
//                           child: Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Row(
//                               children: [
//                                 Container(
//                                   width: 40,
//                                   height: 40,
//                                   child: CircleAvatar(
//                                     radius: 30.0,
//                                     backgroundImage: NetworkImage(
//                                       "https://thumbs.dreamstime.com/b/happy-person-portrait-smiling-woman-tanned-skin-curly-hair-happy-person-portrait-smiling-young-friendly-woman-197501184.jpg",
//                                     ),
//                                     backgroundColor: Colors.transparent,
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text(listallchat[index].sentBy.toString()
//                                               ,
//                                               style: TextStyle(
//                                                 color: Color(0xff0C305A),
//                                                 fontSize: 16,
//                                               ),
//                                             ),
//                                             Text(listallchat[index].date.toString(),style: TextStyle(fontSize: 12,color: Colors.grey.shade700),)
//
//                                           ],
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                             left: 8.0, top: 2),
//                                         child: Text(
//                                           listallchat[index].subject.toString(),
//                                           // chatModelList[index].lastMsg,
//                                           style: TextStyle(
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.w400,
//
//                                               color: Colors.grey.shade600),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 // Text(null!=chatModelList[index].lastMsgTime?
//                                 // convertTime(chatModelList[index].lastMsgTime):""
//                               ],
//                             ),
//                           ),
//                         ),
//                         onTap: () {
//                           Navigator.of(context, rootNavigator: true).push(
//                               MaterialPageRoute(
//                                   builder: (BuildContext context) =>
//                                       AdminMessageScreen()));
//                         },
//                       );
//                     })
//               )),
//         ),
//       ),
//     );
//   }
//
//
//   // Future<List<ChatModel>?> getAllChat() async {
//   // Preferances().getToken().then((value) async{
//   //   final response = await http.post(
//   //       Uri.parse(
//   //           ApiData.ALL_Message),
//   //       headers:value );
//   //
//   //   final jsonData = jsonDecode(response.body);
//   //   var data =ChatModel.fromJson(jsonData).data;
//   //   return data;
//   // });
//   //
//   // }
//   Future getAllChat() async {
//     isLoading = true;
//     setState(() {});
//     Preferances().getToken().then((value) async {
//       var response =
//       await http.post(Uri.parse(ApiData.ALL_Message),body: value);
//       final responsebody = json.decode(response.body.toString());
//
//       isLoading = false;
//       setState(() {});
//       if (responsebody['status'] == 200) {
//         List dataList = responsebody['data'];
//         if (null != dataList && dataList.length > 0) {
//           listallchat = dataList
//               .map((spacecraft) => new AdminChatModel.fromJson(spacecraft))
//               .toList();
//           // String data = packageModelList[0].id.toString();
//         }
//       }
//       setState(() {});
//     });
//   }
// }
