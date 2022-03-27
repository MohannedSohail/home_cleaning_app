import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'account_Screen2.dart';
import 'account_screen.dart';
import 'calender.dart';
import 'calenderscreen.dart';

class MyPlanCleaner extends StatefulWidget {
  @override
  _MyPlanCleanerState createState() => _MyPlanCleanerState();
}

class _MyPlanCleanerState extends State<MyPlanCleaner> {
  int _value = 0;
  int _btn_value=0;
  var isVisible =true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5c4db1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text("Your Plan",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 40),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Selected Cleaning",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, left: 30, right: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Column(
                                children: [
                                  Container(
                                    child: Image.asset("assets/png8.png",
                                        height: 130),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Color(0xffDFDEFF),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Text("Initial Cleaning",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                children: [
                                  Container(
                                    child: Image.asset("assets/png7.png",
                                        height: 130),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Color(0xffDFDEFF),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Text("Upkeep Cleaning",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: GestureDetector(
                              onTap: () => setState(() => _value = 0),
                              child: _value == 0
                                  ? Icon(
                                      Icons.check_circle,
                                      size: 25,
                                      color: Color(0xffDC4F89),
                                    )
                                  : Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: GestureDetector(
                              onTap: () => setState(() => _value = 1),
                              child: _value == 1
                                  ? Icon(
                                      Icons.check_circle,
                                      size: 25,
                                      color: Color(0xffDC4F89),
                                    )
                                  : Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0, left: 40),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Selected Frequency",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0, left: 40),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color:_btn_value==2? Color(0xffDC4F89): Colors.white ,
                                    border:
                                        Border.all(color:_btn_value==2? Colors.white: Colors.black26)),
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      _btn_value=2;
                                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => AccountScreen2()));

                                    });
                                  },
                                  child: Text(
                                    "Weekly",
                                    style: TextStyle(
                                        color: _btn_value==2? Colors.white: Colors.black26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color:_btn_value==1? Color(0xffDC4F89): Colors.white ,
                                    border:
                                    Border.all(color:_btn_value==1? Colors.white: Colors.black26)),
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      _btn_value=1;
                                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => AccountScreen()));

                                    });
                                  },
                                  child: Text(
                                    "Bi-Weekly",
                                    style: TextStyle(
                                        color: _btn_value==1? Colors.white: Colors.black26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color:_btn_value==0? Color(0xffDC4F89):Colors.white,
                                    border: Border.all(color:_btn_value==0? Colors.white: Colors.black26)
                                ),
                              child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      _btn_value=0;

                                    });
                                  },
                                  child: Text(
                                    "Monthly",
                                    style: TextStyle(
                                        color: _btn_value==0? Colors.white:Colors.black26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 40),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Selected Extras",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 30),
                      child: Row(children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Color(0xff5C4DB1),
                                      shape: BoxShape.circle),
                                  child: Stack(
                                    children: [
                                      Align(
                                        child: Image.asset("assets/png6.png",
                                            height: 40),
                                        alignment: Alignment.center,
                                      ),
                                      Positioned(
                                        top: 0.0,
                                        right: 2.5,
                                        child:Container(
                                              width: 23,height: 23,
                                              decoration:BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffDC4F89),

                                              ) ,

                                              child: Align(alignment: Alignment.center,child: Text("4", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 13),)),
                                            )
                                        ),
                                    ],

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text("Inside Fridge",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Color(0xff5C4DB1),
                                      shape: BoxShape.circle),
                                  child: Align(

                                    child: Image.asset("assets/png2.png",
                                        height: 40),
                                    alignment: Alignment.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text("Organizing",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Color(0xff5C4DB1),
                                      shape: BoxShape.circle),
                                  child: Stack(
                                    children: [
                                      Align(
                                        child: Image.asset("assets/png3.png",
                                            height: 40),
                                        alignment: Alignment.center,
                                      ),
                                      Positioned(
                                        // draw a red marble
                                        top: 0.0,
                                        right: 2.5,
                                        child:
                                        Container(
                                          width: 23,height: 23,
                                        decoration:BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xffDC4F89),

                                        ) ,

                                        child: Align(alignment: Alignment.center,child: Text("10", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 13),)),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text("Small Blinds",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 30, bottom: 20),
                      child: Row(children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Color(0xff5C4DB1),
                                      shape: BoxShape.circle),
                                  child: Align(

                                        child: Image.asset("assets/png5.png",
                                            height: 40),
                                        alignment: Alignment.center,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text("Patio",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Color(0xff5C4DB1),
                                      shape: BoxShape.circle),
                                  child: Align(
                                        child: Image.asset("assets/png2.png",
                                            height: 40),
                                        alignment: Alignment.center,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text("Organizing",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Color(0xff5C4DB1),
                                      shape: BoxShape.circle),
                                  child: Stack(
                                    children: [
                                      Align(

                                        child: Image.asset("assets/png3.png",
                                            height: 40,),
                                        alignment: Alignment.center,
                                      ),
                                      Positioned(
                                        // draw a red marble
                                        top: 0.0,
                                        right: 2.5,
                                        child:
                                        Container(
                                          width: 23,height: 23,
                                          decoration:BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xffDC4F89),

                                          ) ,

                                          child: Align(alignment: Alignment.center,child: Text("10", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 13),)),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text("Small Blinds",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                ),

                              ],
                            ),
                          ),
                        )
                      ]),
                    ),

                    Container(
                      decoration: BoxDecoration( color: Color(0xff5C4DB1),borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Calender()));
                      },child: Text("Go To Calender Screen  ",style: TextStyle(color: Colors.white)),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
