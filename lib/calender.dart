import 'dart:math';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'event.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  var isVisible = true;
  var isVisibleImage = false;
  Map<DateTime, List<Event>> selectedEvent = {};
  var _opacity = 1.0;
  DateTime calendarSelectedDay = DateTime.now();
  DateTime calendarFocusedDay = DateTime.now();

  var selectedFormatter = DateFormat('dd-MM-yyy');
  var _nameController = TextEditingController();

  List<Event> _getEventfromDay(DateTime date) {
    return selectedEvent[date] ?? [];
  }

  final List _cleaningList = ["Upkeep Cleaning", "Initial Cleaning"];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    var date = DateTime.now();
    var formatter = DateFormat('dd MMMM yyyy');
    var oclockformatter = DateFormat.j();
    var oclockformatte = DateFormat.jm();

    var _selectedCleaningType;

    String formattedDate = formatter.format(calendarSelectedDay);

    return Scaffold(
      backgroundColor: Color(0xff5C4DB1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Align(
            alignment: Alignment.center,
            child: Text(
              "Cleaner Calendar",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      ),
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
                onDaySelected: (DateTime selectedDay, DateTime focusDay) {
                  setState(() {
                    calendarSelectedDay = selectedDay;
                    calendarFocusedDay = focusDay;

                    print("selectedDay ${formattedDate}");
                  });
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(calendarSelectedDay, date);
                },
                eventLoader: _getEventfromDay,
                calendarFormat: CalendarFormat.week,
                startingDayOfWeek: StartingDayOfWeek.sunday,
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
                  markerDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffDFDEFF),
                    border: Border.all(color: Colors.black),
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Color(0xffFFBF67),
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Color(0xffDFDEFF).withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(
                      color: Colors.white,
                    ),
                    weekdayStyle: TextStyle(color: Colors.white)),
              ),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(milliseconds: 500),
              curve: Curves.linear,
              child: Container(
                margin: EdgeInsets.only(top: height / 6.5),
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
                              "$formattedDate",
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

                        ..._getEventfromDay(calendarSelectedDay).map(
                          (Event event) => Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
                                      width: 40,
                                      child: Text(
                                        "${oclockformatter.format(event.time)}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Container(
                                      height: 0.5,
                                      color: Colors.grey,
                                      width: 33,
                                    ),
                                  ],
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
                                                Text(event.name),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  event.cleaningType,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                     ),
                                                ),
                                                SizedBox(
                                                  height: 13,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    // Icon(Icons.access_time,
                                                    //     color: Color(0xff5C4DB1),),

                                                    SvgPicture.asset("assets/oclock.svg"),
                                                    SizedBox(
                                                      width: 12,
                                                    ),
                                                    Text(
                                                        "${oclockformatte.format(event.time) + "  -  " + TimeOfDay.fromDateTime(event.time.subtract(Duration(hours: -1))).format(context)}",style: TextStyle(
                                                      color: Color(0xff5C4DB1),
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 12,
                                                    )),

                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 13,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Client Rating",style: TextStyle(
                                                        color: Colors.grey,
                                                       )),
                                                    SizedBox(
                                                      width:15,
                                                    ),
                                                    Icon(Icons.star,
                                                        color: Colors.black,size: 20),
                                                    SizedBox(
                                                      width: 3,
                                                    ),
                                                    Icon(Icons.star,
                                                        color: Colors.black,size: 20),
                                                    SizedBox(
                                                      width: 3,
                                                    ),
                                                    Icon(Icons.star,
                                                        color: Colors.black,size: 20),

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
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5.0),
                                          child: Row(
                                            children: [
                                              Icon(Icons.phone_outlined,
                                                  color: Color(0xff5C4DB1)),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Icon(Icons.mail_outline_outlined,
                                                  color: Color(0xff5C4DB1)),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 14.0),
                                                child: Text(("\$50"),style: TextStyle(color: Color(0xff5C4DB1),fontSize: 15,fontWeight: FontWeight.bold,),),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
              child: Positioned(
                top: height / 6.5,
                right: width / 3.2,
                child: InkWell(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                        isVisibleImage = !isVisibleImage;
                        _opacity = 0.0;
                      });
                    },
                    child: Image.asset(
                      "assets/calendar-icon.png",
                      height: 30,
                    )),
              ),
            ),
            Visibility(
              visible: isVisibleImage,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                        isVisibleImage = !isVisibleImage;
                        _opacity = 1.0;
                      });
                    },
                    child: Image.asset(
                      "assets/Mask Group 65.png",
                      height: 30,
                    )),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 10,
        splashColor: Color(0xff5C4DB1),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setStatee) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    scrollable: false,
                    title: Text("Add Event On Calendar",
                        textAlign: TextAlign.center),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: "Enter Your Name",
                              prefixIcon:
                                  Icon(Icons.person, color: Color(0xff5C4DB1)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 5),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(15),
                              icon: SvgPicture.asset(
                                "assets/calendar-4.svg",
                                height: 18,
                                width: 18,
                              ),
                              items: _cleaningList.map((cleaningType) {
                                return DropdownMenuItem(
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    cleaningType,
                                  ),
                                  value: cleaningType,
                                );
                              }).toList(),
                              value: _selectedCleaningType,
                              hint: Text("Select CleaningType "),
                              onChanged: (value) {
                                setStatee(() {
                                  _selectedCleaningType = value;
                                });
                              },
                            )),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: BoxBorder.lerp(
                                  Border.all(
                                      color: Colors.black38,
                                      style: BorderStyle.solid,
                                      width: 0.8),
                                  Border.all(
                                      color: Colors.black38,
                                      style: BorderStyle.solid),
                                  0.1)),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (_nameController.text.toString().isNotEmpty &&
                              _selectedCleaningType.toString().isNotEmpty &&
                              _selectedCleaningType != null) {
                            if (selectedEvent[calendarSelectedDay] != null) {
                              Event event = Event(_nameController.text, date,
                                  _selectedCleaningType);
                              selectedEvent[calendarSelectedDay]?.add(event);
                              Navigator.pop(context);

                              setState(() {});
                            } else {
                              selectedEvent[calendarSelectedDay] = [
                                Event(_nameController.text, date,
                                    _selectedCleaningType)
                              ];
                              Navigator.pop(context);

                              setState(() {});
                            }
                          } else {}

                          setState(() {
                            _nameController.clear();
                          });
                        },
                        child: Text("OK",
                            style: TextStyle(
                              color: Color(0xff5C4DB1),
                            )),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(CircleBorder()),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(13)),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
                                  (states) {
                            if (states.contains(MaterialState.pressed))
                              return Color(0xffFFBF67); // <-- Splash color
                          }),
                        ),
                      ),
                    ],
                  );
                });
              });
        },
        label: Text("Add Event"),
        icon: Icon(
          Icons.add,
        ),
        backgroundColor: Color(0xffFFBF67),
      ),
    );
  }

  // DropdownButtonHideUnderline buildDropdownButton() {
  //   return DropdownButtonHideUnderline(
  //       child: DropdownButton(
  //         isExpanded: true,
  //         borderRadius: BorderRadius.circular(15),
  //         items: _cleaningList.map((country) {
  //           return DropdownMenuItem(
  //             alignment: AlignmentDirectional.center,
  //             child: Text(
  //               country,
  //             ),
  //             value: country,
  //           );
  //         }).toList(),
  //         value: _selectedCleaningType,
  //         hint: Text("Select You Country "),
  //         onChanged: (value){
  //           setState(() {
  //             _selectedCleaningType=value;
  //           });
  //         },
  //       ));
  // }

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
