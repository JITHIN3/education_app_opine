import 'package:education_app_opine/Models/fee_history_modal.dart';
import 'package:flutter/material.dart';
class FeeReceiptScreen extends StatefulWidget {
  FeePaidDetail? feePaidDetail;
  FeeReceiptScreen(this.feePaidDetail);

  @override
  State<FeeReceiptScreen> createState() => _FeeReceiptScreenState();
}

class _FeeReceiptScreenState extends State<FeeReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF8F8F8),
        leading: Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.keyboard_backspace_rounded)),
          ),
        ]),
        title: Text('Fee History'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1,color: Color(0xFFD5D5D5)),
                borderRadius: BorderRadius.circular(30)
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(top: 29.0,left: 16,right: 16,bottom: 29),
                  child: Column(
                    children: [
                      Text('Fee Payment Details',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline
                        ),),
                      Container(
                        margin: EdgeInsets.only(top: 35),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Receipt No : ${widget.feePaidDetail!.receiptNo.toString()}',
                              style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500,
                              ),),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('Successfully Transfered',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF00B412)
                                  ),),
                                SizedBox(height: 5,),
                                Text(widget.feePaidDetail!.detail![0].paidDate.toString(),
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF7D7D7D)
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Student Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                  ),),
                                Text(widget.feePaidDetail!.studentName.toString(), style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black
                                ),)
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('ID No',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                  ),),
                                Text(widget.feePaidDetail!.receiptNo.toString(), style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black
                                ),)
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Class',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                  ),),
                                Text('${widget.feePaidDetail!.className} ${widget.feePaidDetail!.divisionName}', style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black
                                ),)
                              ],
                            ),
                            Divider(height: 35),
                            ListView.builder(physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: widget.feePaidDetail?.detail?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      // mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(widget.feePaidDetail!.detail![index].feeName.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                          ),),
                                        Text('₹${widget.feePaidDetail?.detail?[index].feeAmount}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,

                                          ),)
                                      ],
                                    ),
                                  );
                                }
                            ),
                            Divider(height: 35),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Payment',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                  ),),
                                Text('₹${widget.feePaidDetail?.totalAmt}', style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black
                                ),)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 40),
                alignment: Alignment.bottomCenter,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xFFB9C9FF),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: IconButton(onPressed: (){}, icon: Icon(Icons.share_rounded,color: Color(0xFF2648BD),))),
                      Text('Share')
                    ],
                  ),
                    Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10,
                      children: [
                        Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(0xFFB9C9FF),
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.file_download,color: Color(0xFF2648BD),))),
                        Text('Download')
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
