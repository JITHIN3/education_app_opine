import 'package:flutter/material.dart';
class MonthCard extends StatefulWidget {
  const MonthCard({Key? key}) : super(key: key);

  @override
  State<MonthCard> createState() => _MonthCardState();
}

class _MonthCardState extends State<MonthCard> {

  bool january =false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 165,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.1),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("January"),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹ 2300",
                        style: TextStyle(fontSize: 17),
                      ),
                      InkWell(onTap: (){
                               setState(() {

                                 january =false;
                               });

                      },
                        child: Container(height: 20,width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.blue.withOpacity(.4),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Icon(Icons.arrow_downward_outlined,
                              size: 12,color: Colors.blueGrey),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(width: 165,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(.1),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding:
                const EdgeInsets.only(top: 10, left: 10, right: 10,bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("January"),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹ 2300",
                          style: TextStyle(fontSize: 17),
                        ),
                        InkWell(onTap: (){


                        },
                          child: Container(height: 20,width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.blue.withOpacity(.4),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Icon(Icons.arrow_downward_outlined,
                                size: 12,color: Colors.blueGrey),
                          ),
                        ),
                        january ? Container(child: Text("nd"),):Container(),

                      ],
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
