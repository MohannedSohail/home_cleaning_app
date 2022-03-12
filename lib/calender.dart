import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {

  var isVisible =true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Color(0xff5C4DB1) ,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: height / 2.0,
              color: Color(0xff5C4DB1),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                startingDayOfWeek: StartingDayOfWeek.saturday,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  titleCentered: true,
                  leftChevronIcon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 15,
                  ),
                  rightChevronIcon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 15,
                  ),
                  leftChevronMargin: EdgeInsets.only(left: 100),
                  rightChevronMargin: EdgeInsets.only(right: 100),
                ),
                calendarStyle: CalendarStyle(
                  defaultTextStyle: TextStyle(color: Colors.white),
                  weekendTextStyle: TextStyle(color: Colors.white),
                  selectedDecoration: BoxDecoration(
                    color: Color(0xffFFBF67),
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Color(0xffFFBF67),
                    shape: BoxShape.circle,
                  ),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(color: Colors.black),
                    weekdayStyle: TextStyle(color: Colors.black)),
              ),
            ),
           Visibility(
             visible: isVisible,
             child: Container(
                margin: EdgeInsets.only(top: height / 2.5),
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "18 April 2020",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        // Align(
                        //   alignment: Alignment.topLeft,
                        //   child: Text(
                        //     "18 April 2020",
                        //     style: TextStyle(color: Colors.grey),
                        //   ),
                        // ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              child: Text(
                                "10 AM",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(18),
                                margin: EdgeInsets.only(bottom: 20, left: 10),
                                color: Color(0xffDFDEFF),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Michael Hamilton"),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "Upkeep Cleaning",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.timer,
                                                    color: Color(0xff5C4DB1)),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("10AM - 11AM"),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text("Client Rating"),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(Icons.star,
                                                    color: Colors.black),
                                                Icon(Icons.star,
                                                    color: Colors.black),
                                                Icon(Icons.star,
                                                    color: Colors.black),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Image.asset(
                                          "assets/personman.png",
                                          width: 70,
                                          height: 70,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 0.5,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.phone_outlined,
                                            color: Color(0xff5C4DB1)),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Icon(Icons.mail_outline_outlined,
                                            color: Color(0xff5C4DB1)),
                                        Spacer(),
                                        Text(("\$50")),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              child: Text(
                                "10 AM",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(18),
                                margin: EdgeInsets.only(bottom: 20, left: 10),
                                color: Color(0xffDFDEFF),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Michael Hamilton"),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "Upkeep Cleaning",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.timer,
                                                    color: Color(0xff5C4DB1)),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("10AM - 11AM"),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children:const [
                                                Text("Client Rating"),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(Icons.star,
                                                    color: Colors.black),
                                                Icon(Icons.star,
                                                    color: Colors.black),
                                                Icon(Icons.star,
                                                    color: Colors.black),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Image.asset(
                                          "assets/personman.png",
                                          width: 70,
                                          height: 70,
                                        ),
                                      ],
                                    ),
                                    const     SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 0.5,
                                      color: Colors.grey,
                                    ),
                                    const   SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children:const [
                                        Icon(Icons.phone_outlined,
                                            color: Color(0xff5C4DB1)),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Icon(Icons.mail_outline_outlined,
                                            color: Color(0xff5C4DB1)),
                                        Spacer(),
                                        Text(("\$50")),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              child: Text(
                                "10 AM",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(18),
                                margin: EdgeInsets.only(bottom: 20, left: 10),
                                color: Color(0xffDFDEFF),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Michael Hamilton"),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "Upkeep Cleaning",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.timer,
                                                    color: Color(0xff5C4DB1)),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("10AM - 11AM"),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text("Client Rating"),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(Icons.star,
                                                    color: Colors.black),
                                                Icon(Icons.star,
                                                    color: Colors.black),
                                                Icon(Icons.star,
                                                    color: Colors.black),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Image.asset(
                                          "assets/personman.png",
                                          width: 70,
                                          height: 70,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 0.5,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.phone_outlined,
                                            color: Color(0xff5C4DB1)),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Icon(Icons.mail_outline_outlined,
                                            color: Color(0xff5C4DB1)),
                                        Spacer(),
                                        Text(("\$50")),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
           ) ,
            Positioned(
              top: height / 2.5,
              right: width / 3,
              child: InkWell(onTap: (){setState(() {
                isVisible=!isVisible;
              });},child: Image.asset("assets/calendar-icon.png", height: 30,)),
            ),
          ],
        ),
      ),
    );
  }

  Row dayTask(String time, String name) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.2,
          child: Text(
            time,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(20),
            color: Color(0xffdfdeff),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Color(0xff5C4DB1), fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Upkeep Cleaning',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.timer,
                      color: Color(0xff5C4DB1),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "$time - 5 pm",
                      style: TextStyle(
                          color: Color(0xff5C4DB1),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Client Rating",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: Color(0xff5C4DB1),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.mail_outline,
                      color: Color(0xff5C4DB1),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      "\$50",
                      style: TextStyle(
                          color: Color(0xff5C4DB1),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
