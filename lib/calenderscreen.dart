import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5C4DB1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Select Date",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Column(

        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            startingDayOfWeek: StartingDayOfWeek.saturday,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
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
              leftChevronMargin: EdgeInsets.only(left: 70),
              rightChevronMargin: EdgeInsets.only(right: 70),
            ),
            calendarStyle: CalendarStyle(
              weekendTextStyle: TextStyle(color: Colors.white),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Colors.white),
                weekdayStyle: TextStyle(color: Colors.white)),
          ),

          // FloatingActionButton(
          //   backgroundColor: Color(0xff5C4DB1),
          //   elevation: 0,
          //   onPressed: () {},
          //   child: Icon(Icons.keyboard_arrow_down_rounded,color: Colors.white,),
          // ),

          Row(
            children: [
              Expanded(
                child: Container(
                    color: Colors.white,
                  height: 40,
                  width: double.infinity,

                ),
              ),
              Expanded(child: Container( color: Colors.white,height: 30,child: Image.asset("assets/calendar-icon.png"))),
              Expanded(
                child: Container(
                  color: Colors.white,
                  height: 40,
                  width: double.infinity,


                ),
              ),
            ],
          ),



          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white),
              child: Container(
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
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          dayTask("10 am", "Michael Hamilton"),
                          dayTask("11 am", "Alexandra Johnson"),
                          dayTask("2 pm", "Michael Hamilton"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
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
