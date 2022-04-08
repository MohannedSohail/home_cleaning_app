import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';



class AccountScreen2 extends StatefulWidget {
  const AccountScreen2({Key? key}) : super(key: key);

  @override
  _AccountScreen2State createState() => _AccountScreen2State();
}

class _AccountScreen2State extends State<AccountScreen2> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,

    ]);
    var height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff5c4db1),
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 18),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: SvgPicture.asset(
                            "assets/svg3.svg",
                            height: 70,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 10),
                          child:
                              SvgPicture.asset("assets/svg4.svg", height: 90),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Column(
                      children:  [
                        Text("Hi Kate,\nWelcome Back",
                            style: GoogleFonts.ubuntu(textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                        Padding(
                          padding: EdgeInsets.only(top: 18.0),
                          child: Text(" 70% Completed",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Color(0xffFFBF67),
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          buildText("Account"),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: buildSettingsItem("assets/Group 3614.svg", "Notifications"),),
                          buildSettingsItem("assets/calendar-4.svg", "My Bookings"),
                          buildSettingsItem("assets/tick-2.svg", "My Plan"),
                          buildSettingsItem("assets/address.svg", "Addresses"),
                          buildText("Share"),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child:buildSettingsItem("assets/Path 4536.svg", "Facebook"),),
                          buildSettingsItem("assets/Path 4537.svg", "Twitter"),
                          buildSettingsItem("assets/Group 3613.svg", "Gmail"),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildSettingsItem(String img, String txt) {
    return Container(
      height: 63,
      decoration: const BoxDecoration(
          color: Color(0xffFFFFFF),
          border:
              Border(bottom: BorderSide(width: 0.4, color: Colors.black12))),
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: SvgPicture.asset(
              img,
              height: 20,
              width: 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Text(
              txt,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildText(String txt) {
    return Padding(
      padding: EdgeInsets.only(top: 35.0, left: 40),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            txt,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          )),
    );
  }
}
