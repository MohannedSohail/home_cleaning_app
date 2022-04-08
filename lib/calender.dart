import 'dart:math';
import 'package:flutter/material.dart';
import 'package:home_cleaning_app/mytoast.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'event.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


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
  final _nameController = TextEditingController();

  List<Event> _getEventfromDay(DateTime date) {
    return selectedEvent[date] ?? [];
  }

  final List _cleaningList = ["Upkeep Cleaning", "Initial Cleaning"];
  var oclockformatte = DateFormat.jm();
  var oclockformatter = DateFormat.j();


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,

    ]);

    var _selectedCleaningType;

    var height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    var ftoast = FToast();
    ftoast.init(context);

    var date = DateTime.now();
    var formatter = DateFormat('dd MMMM yyyy');


    String formattedDate = formatter.format(calendarSelectedDay);

    return Scaffold(
      backgroundColor: const Color(0xff5C4DB1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  Align(
            alignment: Alignment.center,
            child: Text(
              "Cleaner Calendar",

              style: GoogleFonts.ubuntu(textStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            )),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: height / 2.0,
              color: const Color(0xff5C4DB1),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: calendarFocusedDay,
                onDaySelected: (DateTime selectedDay, DateTime focusDay) {
                  setState(() {
                    calendarSelectedDay = selectedDay;
                    focusDay = focusDay;

                    print("selectedDay ${selectedDay}");
                    print("calendarSelectedDay ${calendarSelectedDay}");
                    print("calendarFocusedDay ${calendarFocusedDay}");
                    print("focusDay ${focusDay}");
                    print("date ${date}");

                    print("-------------------------------------------");
                  });

                  print("selectedDay ${selectedDay}");
                  print("calendarSelectedDay ${calendarSelectedDay}");
                  print("calendarFocusedDay ${calendarFocusedDay}");
                  print("focusDay ${focusDay}");
                  print("date ${date}");
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(calendarSelectedDay, date);
                },
                eventLoader: _getEventfromDay,
                calendarFormat: CalendarFormat.week,
                startingDayOfWeek: StartingDayOfWeek.sunday,
                headerStyle:  HeaderStyle(
                  formatButtonVisible: false,
                  titleTextStyle: GoogleFonts.ubuntu(textStyle:TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ), ) ,
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
                  leftChevronMargin: EdgeInsets.only(left: 110),
                  rightChevronMargin: EdgeInsets.only(right: 110),
                ),
                calendarStyle: CalendarStyle(
                  defaultTextStyle: const TextStyle(color: Colors.white),
                  weekendTextStyle: const TextStyle(color: Colors.white),
                  markerDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xffDFDEFF),
                    border: Border.all(color: Colors.black),
                  ),
                  selectedDecoration: const BoxDecoration(
                    color: Color(0xffFFBF67),
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: const Color(0xffDFDEFF).withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                    weekendStyle: TextStyle(
                      color: Colors.white,
                    ),
                    weekdayStyle: TextStyle(color: Colors.white)),
              ),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
              child: Container(
                margin: EdgeInsets.only(top: height / 6.5),
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 15),
                  child:_getEventfromDay(calendarSelectedDay).isEmpty? Center(
                    child: Container(
                      child: Text("There is no Events",style: GoogleFonts.antic(textStyle:TextStyle(color: Colors.grey,fontSize: 16),),),

                    ),
                  ) :SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              formattedDate,
                              style: GoogleFonts.ubuntu(textStyle: TextStyle(color: Colors.grey), ),
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
                        const SizedBox(
                          height: 25,
                        ),



                            ..._getEventfromDay(calendarSelectedDay).map(
                          (Event event) =>  dayTaskItem(
                              event.time, event.name, event.cleaningType),
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
        splashColor: const Color(0xff5C4DB1),
        onPressed: () {
          if (DateUtils.dateOnly(calendarSelectedDay)
              .isBefore(DateUtils.dateOnly(calendarFocusedDay))) {
            ftoast.showToast(
              child: show("Selected Day Is In The Past", Colors.red),
              gravity: ToastGravity.BOTTOM,
              toastDuration: const Duration(seconds: 2),
            );

            print(
                "Date Bool 1 ${DateTime.parse(formatter.format(calendarSelectedDay)).isBefore(DateTime.parse(formatter.format(calendarFocusedDay)))}");
          } else {
            print(
                "Date Bool 2 ${calendarSelectedDay.isBefore(calendarFocusedDay)}");

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
                      title:  Text("Add Event On Calendar",
                          textAlign: TextAlign.center,style: GoogleFonts.antic(textStyle: TextStyle(color: Colors.black))),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                labelText: "Enter Your Name",
                                prefixIcon: const Icon(Icons.person,
                                    color: Color(0xff5C4DB1)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                          ),
                          const SizedBox(
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
                                    hint: const Text("Select CleaningType "),
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
                                      style: BorderStyle.solid,),
                                    0.1)),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (_nameController.text.toString().isNotEmpty) {
                              if (_selectedCleaningType.toString().isNotEmpty &&
                                  _selectedCleaningType != null) {
                                if (selectedEvent[calendarSelectedDay] !=
                                    null) {

                                  print("isVisible ${!isVisible}");
                                  print("isVisibleImage ${!isVisibleImage}");

                                  if(isVisibleImage==true ){

                                    setState(() {
                                      _opacity = 1.0;
                                      isVisibleImage=!isVisibleImage;
                                      isVisible=!isVisible;
                                    });
                                  }

                                    print("isVisible ${!isVisible}");
                                    print("isVisibleImage ${!isVisibleImage}");
                                    Event event = Event(_nameController.text,
                                        date, _selectedCleaningType);
                                    selectedEvent[calendarSelectedDay]
                                        ?.add(event);
                                    Navigator.pop(context);

                                    setState(() {

                                    });

                                    ftoast.showToast(
                                      child: trueCheckShow(
                                          "Added Event Successfully ",
                                          Colors.greenAccent.withOpacity(0.7)),
                                      gravity: ToastGravity.BOTTOM,
                                      toastDuration: const Duration(seconds: 4),
                                    );


                                } else {
                                  if(isVisibleImage==true ){

                                    setState(() {
                                      _opacity = 1.0;
                                      isVisibleImage=!isVisibleImage;
                                      isVisible=!isVisible;
                                    });
                                  }
                                  selectedEvent[calendarSelectedDay] = [
                                    Event(_nameController.text, date,
                                        _selectedCleaningType)
                                  ];
                                  Navigator.pop(context);

                                  setState(() {});

                                  ftoast.showToast(
                                    child: trueCheckShow(
                                        "Added Event Successfully ",
                                        Colors.greenAccent.withOpacity(0.7)),
                                    gravity: ToastGravity.BOTTOM,
                                    toastDuration: const Duration(seconds: 4),
                                  );
                                }
                              } else {
                                ftoast.showToast(
                                  child: show(
                                      "The Cleaning Type Is Empty", Colors.red),
                                  gravity: ToastGravity.BOTTOM,
                                  toastDuration: const Duration(seconds: 2),
                                );
                              }
                            } else {
                              ftoast.showToast(
                                child: show("Your Name In Empty", Colors.red),
                                gravity: ToastGravity.BOTTOM,
                                toastDuration: const Duration(seconds: 2),
                              );
                            }
                          },
                          child: const Text("OK",
                              style: TextStyle(
                                color: Color(0xff5C4DB1),
                              )),
                          style: ButtonStyle(
                            shape:
                                MaterialStateProperty.all(const CircleBorder()),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(13)),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                                    (states) {
                              if (states.contains(MaterialState.pressed)) {
                                return const Color(0xffFFBF67);
                              } // <-- Splash color
                            }),
                          ),
                        ),
                      ],
                    );
                  });
                });

            setState(() {
              _nameController.clear();
            });
          }
        },
        label:  Text("Add Event",style: GoogleFonts.ubuntu()),
        icon: const Icon(
          Icons.add,
        ),
        backgroundColor: const Color(0xffFFBF67).withOpacity(0.9),
      ),
    );
  }

  // DropdownButtonHideUnderline buildDropdownButtonHideUnderline(StateSetter setStatee) {
  //   return DropdownButtonHideUnderline(
  //                                   child: DropdownButton(
  //                                 isExpanded: true,
  //                                 borderRadius: BorderRadius.circular(15),
  //                                 icon: SvgPicture.asset(
  //                                   "assets/calendar-4.svg",
  //                                   height: 18,
  //                                   width: 18,
  //                                 ),
  //                                 items: _cleaningList.map((cleaningType) {
  //                                   return DropdownMenuItem(
  //                                     alignment: AlignmentDirectional.center,
  //                                     child: Text(
  //                                       cleaningType,
  //                                     ),
  //                                     value: cleaningType,
  //                                   );
  //                                 }).toList(),
  //                                 value: _selectedCleaningType,
  //                                 hint: const Text("Select CleaningType "),
  //                                 onChanged: (value) {
  //                                   setStatee(() {
  //                                     _selectedCleaningType = value;
  //                                   });
  //                                 },
  //                               ));
  // }

  Padding dayTaskItem(DateTime time, String name, String cleaningType) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 35,
                child: Text(
                  oclockformatter.format(time),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
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
              padding: const EdgeInsets.all(18),
              margin: const EdgeInsets.only(bottom: 20, left: 10),
              color: const Color(0xffDFDEFF),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold,color: Color(0xff5C4DB1),),),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            cleaningType,
                            style: GoogleFonts.ubuntu(textStyle: TextStyle(
                              color: Colors.grey,
                            ),) ,
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Icon(Icons.access_time,
                              //     color: Color(0xff5C4DB1),),

                              SvgPicture.asset("assets/oclock.svg"),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                  oclockformatte.format(time) +
                                      "  -  " +
                                      TimeOfDay.fromDateTime(time.subtract(
                                              const Duration(hours: -1)))
                                          .format(context),
                                  style: GoogleFonts.ubuntu(textStyle: TextStyle(
                                    color: Color(0xff5C4DB1),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),) ),
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Row(
                            children:  [
                              Text("Client Rating",
                                  style: GoogleFonts.ubuntu(color: Colors.grey)),
                              SizedBox(
                                width: 15,
                              ),
                              Icon(Icons.star, color: Colors.black, size: 20),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(Icons.star, color: Colors.black, size: 20),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(Icons.star, color: Colors.black, size: 20),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      children:  [
                        Icon(Icons.phone_outlined, color: Color(0xff5C4DB1)),
                        SizedBox(
                          width: 30,
                        ),
                        Icon(Icons.mail_outline_outlined,
                            color: Color(0xff5C4DB1)),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 14.0),
                          child: Text(
                            ("\$50"),
                            style:  GoogleFonts.merienda(textStyle:TextStyle(
                              color: Color(0xff5C4DB1),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ), ),
                          ),
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

}
