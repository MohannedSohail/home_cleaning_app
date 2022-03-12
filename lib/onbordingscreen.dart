import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'appointment_screen.dart';
import 'plancleaner.dart';

class OnBordingScreen extends StatefulWidget {
  @override
  _OnBordingScreenState createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5c4db1),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 50,
                width: 100,
                margin: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/logo.png"),
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              const Text("Clean Home\n  Clean Life.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30,
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text(
                  "Book Cleaners at the Comfort\n              of you home.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),

              const SizedBox(
                height: 70,
              ),

              // SvgPicture.asset("assets/home-image.svg",height: 150,width: 300,),


               Image.asset("assets/splash.png"),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 160,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40),),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => AppointmentScreen()));
                      },
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                         fontSize: 16,
                         fontWeight: FontWeight.bold,
                         color: Color(0xff5c4db1),
                        ),
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
}
