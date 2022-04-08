import 'package:flutter/material.dart';
import 'account_Screen2.dart';
import 'account_screen.dart';
import 'calender.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';


class MyPlanCleaner extends StatefulWidget {
  const MyPlanCleaner({Key? key}) : super(key: key);

  @override
  _MyPlanCleanerState createState() => _MyPlanCleanerState();
}

class _MyPlanCleanerState extends State<MyPlanCleaner> {
  int _value = 0;
  int _btn_Value = 0;


  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
      // DeviceOrientation.landscapeLeft,
      // DeviceOrientation.landscapeRight,
    ]);

    var height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // final Orientation orientation = MediaQuery.of(context).orientation;
     // bool isLandscape = orientation==Orientation.landscape;

    return Scaffold(
      backgroundColor: const Color(0xff5c4db1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  Align(
            alignment: Alignment.center,
            child: Text(
              "Your Plan ",
              style: GoogleFonts.ubuntu(textStyle:TextStyle(fontWeight: FontWeight.bold, fontSize: 16),) ,
            )),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 8),
          height: height,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                 Padding(
                  padding: EdgeInsets.only(top: 35.0, left: 40),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Selected Cleaning",
                        style:GoogleFonts.ubuntu(textStyle:TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold), ) ,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 15, right: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: buildContainer("assets/png7.png","Initial Cleaning"),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: buildContainer("assets/png8.png","Upkeep Cleaning"),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0,left: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: buildGestureDetector(0),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: buildGestureDetector(1),
                        ),
                      ),
                    ],
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 25.0, left: 40),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Selected Frequency",
                        style:GoogleFonts.ubuntu(textStyle:TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold), ) ,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 30),
                  child: Row(
                    children: [
                      buildExpandedCheckContainer(
                          context,
                          2,
                          "Weekly",
                          MaterialPageRoute(
                              builder: (_) => const AccountScreen())),
                      buildExpandedCheckContainer(
                          context,
                          1,
                          "Bi-weekly",
                          MaterialPageRoute(
                              builder: (_) => const AccountScreen2())),
                      buildExpandedCheckContainer(
                          context,
                          0,
                          "Monthly",
                          MaterialPageRoute(
                              builder: (_) => const AccountScreen())),
                    ],
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 25.0, left: 40),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Selected Extras",
                        style: GoogleFonts.ubuntu(textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold),),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 30),
                  child: Row(children: [
                    buildExpandedContainerWithPositioned(
                        "assets/png6.png", "Inside Fridge", "4"),
                    buildExpandedCircleContainer(
                        "assets/png2.png", "Organizing"),
                    buildExpandedContainerWithPositioned(
                        "assets/png3.png", "Small Blinds", "10")
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 30, bottom: 20),
                  child: Row(children: [
                    buildExpandedCircleContainer(
                        "assets/png5.png", "Patio"),
                    buildExpandedCircleContainer(
                        "assets/png2.png", "Organizing"),
                    buildExpandedContainerWithPositioned(
                        "assets/png3.png", "Small Blinds", "10")
                  ]),
                ),
                buildCustomButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildExpandedCircleContainer(String img, String txt) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xff5C4DB1), shape: BoxShape.circle),
              child: Align(
                child: Image.asset(img, height: 40),
                alignment: Alignment.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(txt,
                  style: TextStyle(color: Colors.black, fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Container buildCustomButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          color: const Color(0xff5C4DB1),
          borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const Calender()));
        },
        child: const Text("Go To Calender Screen  ",
            style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Expanded buildExpandedContainerWithPositioned(
      String img_Path, String txt, String txt_num) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xff5C4DB1), shape: BoxShape.circle),
              child: Stack(
                children: [
                  Align(
                    child: Image.asset(
                      img_Path,
                      height: 40,
                    ),
                    alignment: Alignment.center,
                  ),
                  Positioned(
                    // draw a red marble
                    top: 0.0,
                    // right: MediaQuery.of(context).size.width/11,
                    right: MediaQuery.of(context).orientation==Orientation.landscape? MediaQuery.of(context).size.height/5.1 :2.5 ,
                    child: Container(
                      width: 23,
                      height: 23,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffDC4F89),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          txt_num,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                txt,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildExpandedCheckContainer(BuildContext context, int clickValue,
      String txt, MaterialPageRoute materialPageRoute) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 15, left: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: _btn_Value == clickValue
                ? const Color(0xffDC4F89)
                : Colors.white,
            border: Border.all(
                color:
                    _btn_Value == clickValue ? Colors.white : Colors.black26)),
        child: MaterialButton(
          onPressed: () {
            setState(() {
              _btn_Value = clickValue;
              Navigator.of(context).push(materialPageRoute);
            });
          },
          child: Text(
            txt,
            style: TextStyle(
                color: _btn_Value == clickValue ? Colors.white : Colors.black26,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(int value) {
    return GestureDetector(
      onTap: () => setState(() => _value = value),
      child: _value == value
          ? const Icon(
              Icons.check_circle,
              size: 25,
              color: Color(0xffDC4F89),
            )
          : Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
    );
  }

  Column buildContainer(String img_path,String txt) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 8,left: 8),
          child: Image.asset(img_path, height: 130),
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color(0xffDFDEFF),
              borderRadius: BorderRadius.circular(30)),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Text(txt,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13)),
        ),

      ],
    );
  }
}
