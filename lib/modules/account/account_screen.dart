
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';




class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
    return Scaffold(
      backgroundColor: const Color(0xff5c4db1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: SvgPicture.asset("assets/svg3.svg",height: 70,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 10),
                child: SvgPicture.asset("assets/svg4.svg",height: 90),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 35.0),
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
