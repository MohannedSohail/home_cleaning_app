
import 'package:flutter/material.dart';
import 'package:home_cleaning_app/modules/plancleaner/plancleaner_screen.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,

    ]);
    return Scaffold(
      body: Column(
        children: [

          const SizedBox(height: 35,),
          Image.asset("assets/home-cleaning.png",fit: BoxFit.cover,),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff5C4DB1),
                borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(

                  children: [
                    const SizedBox(height: 50,),
                     Text("Cleaning On Demand",textAlign: TextAlign.center,style:GoogleFonts.ubuntu(textStyle:TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),) ,),
                    const SizedBox(height: 30,),
                    const Text("Book an appointment in\nless than 60 seconds and get on\n the schedule as early as\n tomorrow.",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500,),),
                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: (){}, child:  Text("Skip",style: GoogleFonts.nunito(textStyle: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal),),)),
                        const Spacer(),
                        Row(
                          children: [
                            TextButton(onPressed: (){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) =>  MyPlanCleaner()));

                            }, child:  Text("Next",style: GoogleFonts.nunito(textStyle: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal),),)),
                            Container(
                              height: 29,
                              width: 29,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,color: Color(0xffFFBF67),

                              ),
                              child: const Icon(
                                Icons.keyboard_arrow_right_rounded,
                                size: 22,
                                color: Colors.white,
                              ),

                            ),
                          ],
                        ),


                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
