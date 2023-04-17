import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:education_app_opine/Apis/Apidata.dart';
import 'package:education_app_opine/ConstantWidget/navigationdrawer.dart';
import 'package:education_app_opine/Models/fee_history_modal.dart';
import 'package:education_app_opine/Models/fee_payment_modal.dart';
import 'package:education_app_opine/Models/payment_history_model.dart';
import 'package:education_app_opine/Preferaneces/preferances.dart';
import 'package:education_app_opine/Screens/FeePayment/fee_receipt.dart';
import 'package:education_app_opine/Screens/NotificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:payu_checkoutpro_flutter/PayUConstantKeys.dart';
import 'package:payu_checkoutpro_flutter/payu_checkoutpro_flutter.dart';
import 'package:education_app_opine/Screens/FeePayment/HashService.dart';
class FeePaymentScreen extends StatefulWidget {
  const FeePaymentScreen({Key? key}) : super(key: key);

  @override
  State<FeePaymentScreen> createState() => _FeePaymentScreenState();
}

class _FeePaymentScreenState extends State<FeePaymentScreen> implements PayUCheckoutProProtocol{
  late PayUCheckoutProFlutter _checkoutPro;
  bool isLoading = true;
  HistoryDataModal paymenthistory = new HistoryDataModal();
  PaymentDataModal paymentDetails = new PaymentDataModal();

  final List<bool> _isOpen = List.filled(12, false);


void _toggleCard(int index) {
    setState(() {
      _isOpen[index] = !_isOpen[index];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _checkoutPro = PayUCheckoutProFlutter(this);
    getFeePaymentDetails();
    getPaymentHistory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return isLoading?
     Scaffold(body: Center(child: CircularProgressIndicator(color: Color(0xFF6867FF)),)):
    Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      drawer: NaviagtionDrawer(),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFF8F8F8),
          title: Text('Fee Payment'),
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
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxHeight: 150.0),
              child: Material(
                color: Color(0xFFB9C9FF),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 5,
                  indicatorColor: Colors.black,
                  unselectedLabelColor: Color(0xFF494949),
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500
                  ),
                  tabs: [
                    Tab(text:'Fee Payment',),
                    Tab(text: 'Fee History',),

                  ],
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
                            Text('Grand Total',
                            style: TextStyle(
                              fontSize:16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),),
                            SizedBox(height: 10,),
                            Text('₹${paymenthistory.grandTotal}',
                                style: TextStyle(
                                fontSize:20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                            ),)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Balance',
                              style: TextStyle(
                                  fontSize:16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),),
                            SizedBox(height: 10,),
                            Text('₹${paymenthistory.balance}',
                              style: TextStyle(
                                  fontSize:20.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),)
                          ],
                        )
                      ],
                    ),
                    Positioned(
                      top: -18,
                      left: MediaQuery.of(context).size.width *.4,
                      width: 36,
                      height: 36,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          // borderRadius:  BorderRadius.all(
                          //   Radius.circular(50),
                          // ),
                          borderRadius:  BorderRadius.circular(50),
                        ),
                      ),

                    ),
                    Positioned(
                      bottom: -18,
                      left: MediaQuery.of(context).size.width *.4,
                      width: 36,
                      height: 36,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          // borderRadius:  BorderRadius.all(
                          //   Radius.circular(50),
                          // ),
                          borderRadius:  BorderRadius.circular(50),
                        ),
                      ),

                    ),
                  ],
                )),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                PaymentDetailCard(),
                PaymentHistoryDetails()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future getFeePaymentDetails() async {
    isLoading = true;
    setState(() {});
    Preferances().getToken().then((value) async {
      var response =
      await http.post(Uri.parse(ApiData.FEE_PAYMENT), body: value);
      var responsebody = json.decode(response.body);
      isLoading = false;
      if (responsebody['status'] == 200) {
        final resdata = responsebody['data'];
        paymentDetails = PaymentDataModal.fromJson(resdata);
        setState(() {});
      }
    });
  }

  Future getPaymentHistory() async {
    setState(() {});
    Preferances().getToken().then((value) async {
      var response = await http.post(Uri.parse(ApiData.Payment_History),body: value);
      final responsebody = json.decode(response.body);
      if (responsebody['status'] == 200) {
      final resData = responsebody['data'];
      paymenthistory = HistoryDataModal.fromJson(resData);
      }
      setState(() {});
    });
  }
  ListView PaymentHistoryDetails() {
    return ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: paymenthistory.feePaidDetails?.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border(left: BorderSide(color: Colors.black,)),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) => FeeReceiptScreen(paymenthistory.feePaidDetails?[index])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    paymenthistory.feePaidDetails![index].feeMonth.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF000000)
                                    ),
                                  ),
                                  // Text(
                                  //   _titles[index]['dueDate'],
                                  //   style: TextStyle(
                                  //       fontSize: 10,
                                  //       fontWeight: FontWeight.w500,
                                  //       color: Color(0xFF7D7D7D)
                                  //   ),
                                  // ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('₹${paymenthistory.feePaidDetails?[index].totalAmt}',style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF000000)
                                  ),),
                                  // Text(
                                  //  'Successfull',
                                  //   style: TextStyle(
                                  //       fontSize: 10,
                                  //       fontWeight: FontWeight.w500,
                                  //       color: Color(0xFF00B412)
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
  }

  ListView PaymentDetailCard() {
    return ListView.builder(
              physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: paymentDetails.feeDetails?.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                      // border: Border(left: BorderSide(color: Colors.black,)),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(-2, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex:3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                  '${paymentDetails.feeDetails?[index].feeMonthName} Fees',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF000000)
                                    ),
                                  ),
                                  Text(
                                    "Due ${paymentDetails.feeDetails?[index].dueDate}",
                                      style: TextStyle(
                                        fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF7D7D7D)
                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex:2,
                              child: Text('₹${paymentDetails.feeDetails?[index].totalAmount}',style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF000000)
                              ),),
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                    onPressed: (){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            duration: Duration(seconds: 3),
                                            backgroundColor: Colors.red,
                                            content: Text("Pay coming soon")),
                                      );
                                      // _checkoutPro.openCheckoutScreen(
                                      //   payUPaymentParams: PayUParams.createPayUPaymentParams(),
                                      //   payUCheckoutProConfig: PayUParams.createPayUConfigParams(),
                                      // );
                                    },
                                    child: Text('Pay',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF6867FF)
                                      ),),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                                    elevation: 0,
                                    primary: Color(0xFFFFFFF),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Color(0xFF6867FF),width: 1),
                                      borderRadius: BorderRadius.circular(8),
                                      // side: BorderSide(color: Colors.black.withOpacity(.3)),
                                    ),
                                  ),
                                ),
                                IconButton( onPressed: () => _toggleCard(index),
                                icon: Icon(Icons.info,color: Color(0xFFB8B8B8)),)
                              ],
                            )
                          ],
                        ),
                        if (_isOpen[index]) ...[
                          Divider(),
                          ListView.builder(physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: paymentDetails.feeDetails?[index].details?.length,
                          itemBuilder: (BuildContext context, int index1) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                // mainAxisSize: MainAxisSize.min,
                               children: [
                                 Text(paymentDetails.feeDetails![index].details![index1].feeheadName.toString(),
                                  style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF9C9C9C)
                            ),),
                                 Text('₹${paymentDetails.feeDetails?[index].details?[index1].amount}',
                                   style: TextStyle(
                                       fontWeight: FontWeight.w400,
                                       color: Color(0xFF9C9C9C)
                                   ),)
                               ],
                              ),
                            );
                          }
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Payment',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF494949)
                              ),),
                              Text('₹${paymentDetails.feeDetails?[index].totalAmount}',
                style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF494949)
                ),)
                            ],
                          )
                        ],
                      ],
                    ),
                  ),
                );
              },
            );
  }

  @override
  generateHash(Map response) {
    // TODO: implement generateHash
    // Map hashResponse = {};
    Map hashResponse = HashService.generateHash(response);
    _checkoutPro.hashGenerated(hash: hashResponse);
  }

  @override
  onError(Map? response) {
    // TODO: implement onError
    print("payment error ${response}");
  }

  @override
  onPaymentCancel(Map? response) {
    // TODO: implement onPaymentCancel
    print("payment cancel ${response}");
  }

  @override
  onPaymentFailure(response) {
    // TODO: implement onPaymentFailure
    print("payment failed ${response}");
  }

  @override
  onPaymentSuccess(response) {
    // TODO: implement onPaymentSuccess
    print("payment success ${response}");
  }
}
class PayUTestCredentials {
  static const merchantKey = "VTUAdH";//TODO: Add Merchant Key
  //Use your success and fail URL's.

  static const iosSurl = "https://payu.herokuapp.com/ios_success";//TODO: Add Success URL.
  static const iosFurl = "https://payu.herokuapp.com/ios_failure";//TODO Add Fail URL.
  static const androidSurl = "https://payu.herokuapp.com/success";//TODO: Add Success URL.
  static const androidFurl = "https://payu.herokuapp.com/failure";//TODO Add Fail URL.

}

//Pass these values from your app to SDK, this data is only for test purpose
class PayUParams {
  static Map createPayUPaymentParams() {
    var siParams = {
      PayUSIParamsKeys.isFreeTrial: true,
      PayUSIParamsKeys.billingAmount: '10',              //Required
      PayUSIParamsKeys.billingInterval: 1,              //Required
      PayUSIParamsKeys.paymentStartDate: '2023-04-14',  //Required
      PayUSIParamsKeys.paymentEndDate: '2023-04-14',    //Required
      PayUSIParamsKeys.billingCycle:                    //Required
      'daily', //Can be any of 'daily','weekly','yearly','adhoc','once','monthly'
      PayUSIParamsKeys.remarks: 'Test SI transaction',
      PayUSIParamsKeys.billingCurrency: 'INR',
      PayUSIParamsKeys.billingLimit: 'ON', //ON, BEFORE, AFTER
      PayUSIParamsKeys.billingRule: 'MAX', //MAX, EXACT
    };





    var payUPaymentParams = {
      PayUPaymentParamKey.key: PayUTestCredentials.merchantKey,
      PayUPaymentParamKey.amount: "1",
      PayUPaymentParamKey.productInfo: "Info",
      PayUPaymentParamKey.firstName: "Abc",
      PayUPaymentParamKey.email: "fyroz.opine@gmail.com",
      PayUPaymentParamKey.phone: "8848498688",
      PayUPaymentParamKey.ios_surl: PayUTestCredentials.iosSurl,
      PayUPaymentParamKey.ios_furl: PayUTestCredentials.iosFurl,
      PayUPaymentParamKey.android_surl: PayUTestCredentials.androidSurl,
      PayUPaymentParamKey.android_furl: PayUTestCredentials.androidFurl,
      PayUPaymentParamKey.environment: "0", //0 => Production 1 => Test
      PayUPaymentParamKey.transactionId: DateTime.now().millisecondsSinceEpoch.toString(),
      PayUPaymentParamKey.enableNativeOTP: true,
    };

    return payUPaymentParams;
  }

  static Map createPayUConfigParams() {

    var payUCheckoutProConfig = {
      PayUCheckoutProConfigKeys.primaryColor: "#4994EC",
      PayUCheckoutProConfigKeys.secondaryColor: "#FFFFFF",
      PayUCheckoutProConfigKeys.merchantName: "PayU",
      PayUCheckoutProConfigKeys.merchantLogo: "logo",
      PayUCheckoutProConfigKeys.showExitConfirmationOnCheckoutScreen: true,
      PayUCheckoutProConfigKeys.showExitConfirmationOnPaymentScreen: true,
      PayUCheckoutProConfigKeys.autoSelectOtp: true,
      PayUCheckoutProConfigKeys.autoApprove: true,
      PayUCheckoutProConfigKeys.merchantSMSPermission: true,
      PayUCheckoutProConfigKeys.showCbToolbar: true,
    };
    return payUCheckoutProConfig;
  }
}
