import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ConstantWidget/query/screensize.dart';

class FeePage2 extends StatefulWidget {
  const FeePage2({Key? key}) : super(key: key);

  @override
  State<FeePage2> createState() => _FeePage2State();
}

class _FeePage2State extends State<FeePage2> {
  int selectedSessionIndex = -1;
  dynamic index;

  bool january = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: InkWell(
                        child: Icon(Icons.arrow_back_rounded,
                            color: Colors.black),
                        onTap: () {
                          Navigator.pop(context);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(6, 10),
                                blurRadius: 10,
                                color: Colors.black.withOpacity(.15))
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Colors.blue.withOpacity(.2)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Text("Pay by team"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Select months",
                style: TextStyle(fontSize: 16, color: Colors.blueGrey.shade400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio:
                           5 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(.1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("January"),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "₹ 2300",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {});
                                        },
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (selectedSessionIndex !=
                                                  index) {
                                                selectedSessionIndex = index;
                                              } else {
                                                selectedSessionIndex = -1;
                                              }
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(bottom: 5),
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                color:
                                                    Colors.blue.withOpacity(.4),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                              ),
                                              child: Icon(
                                                  Icons.arrow_downward_outlined,
                                                  size: 12,
                                                  color: Colors.blueGrey),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        Flexible(
                          child: Visibility(
                            visible: selectedSessionIndex == index,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: Helper.getScreenWidth(context),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [Text("Fee Payment")],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 20, right: 20),
              child: Divider(
                thickness: 2,
                color: Colors.black.withOpacity(.2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: Helper.getScreenWidth(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.blue.withOpacity(.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Academic Fees",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(.4))),
                      SizedBox(
                        height: 10,
                      ),
                      Text("₹ 4000.00", style: TextStyle(fontSize: 16)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Fines",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(.4))),
                      SizedBox(
                        height: 10,
                      ),
                      Text("₹ 500.00", style: TextStyle(fontSize: 16)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Total Amount",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(.4))),
                      SizedBox(
                        height: 5,
                      ),
                      Text("₹ 4500.00", style: TextStyle(fontSize: 23)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10, bottom: 10),
              child: Container(
                width: Helper.getScreenWidth(context),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => CalendarScreen()),
                    // );
                  },
                  child: Text(
                    "Pay now",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.deepOrangeAccent,
                    fixedSize: Size(150, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      // side: BorderSide(color: Colors.black.withOpacity(.3)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
      backgroundColor: Colors.white,
    );
  }
}
