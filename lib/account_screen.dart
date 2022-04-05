
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5c4db1),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Stack(
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
              ),


              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(30),topLeft:Radius.circular(30)),
                    ),

                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 35.0, left: 40),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Account",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,fontSize: 18),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Container(
                            height: 60,
                            decoration: const BoxDecoration(
                                color: Color(0xffFFFFFF),
                                border:Border(bottom: BorderSide(width: 0.4,color: Colors.black12))
                            ),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 40.0),
                                  child: SvgPicture.asset("assets/Group 3614.svg",height: 20,width: 20,),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 40.0),
                                  child: Text("Notifications",style: TextStyle(color: Colors.black,fontSize: 16),),
                                ),


                              ],
                            ),
                          ),
                        ),

                        Container(
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border:Border(bottom: BorderSide(width: 0.4,color: Colors.black12))
                          ),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: SvgPicture.asset("assets/calendar-4.svg",height: 20,width: 20,),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 40.0),
                                child: Text("My Bookings",style: TextStyle(color: Colors.black,fontSize: 16),),
                              ),


                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border:Border(bottom: BorderSide(width: 0.4,color: Colors.black12))
                          ),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: SvgPicture.asset("assets/tick-2.svg",height: 20,width: 20,),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 40.0),
                                child: Text("My Plan",style: TextStyle(color: Colors.black,fontSize: 16),),
                              ),


                            ],
                          ),
                        ),

                        Container(
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border:Border(bottom: BorderSide(width: 0.4,color: Colors.black12))
                          ),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: SvgPicture.asset("assets/address.svg",height: 20,width: 20,),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 40.0),
                                child: Text("Addresses",style: TextStyle(color: Colors.black,fontSize: 16),),
                              ),


                            ],
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(top: 35.0, left: 40),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Share",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,fontSize: 18),
                              )),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Container(
                            height: 60,
                            decoration: const BoxDecoration(
                                color: Color(0xffFFFFFF),
                                border:Border(bottom: BorderSide(width: 0.4,color: Colors.black12))
                            ),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 40.0),
                                  child: SvgPicture.asset("assets/Path 4536.svg",height: 20,width: 20,),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 40.0),
                                  child: Text("Facebook",style: TextStyle(color: Colors.black,fontSize: 16),),
                                ),


                              ],
                            ),
                          ),
                        ),

                        Container(
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border:Border(bottom: BorderSide(width: 0.4,color: Colors.black12))
                          ),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: SvgPicture.asset("assets/Path 4537.svg",height: 20,width: 20,),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 40.0),
                                child: Text("Twitter",style: TextStyle(color: Colors.black,fontSize: 16),),
                              ),


                            ],
                          ),
                        ),
                        Container(
                          height: 70,
                          decoration: const BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius:BorderRadius.only(bottomRight:Radius.circular(20),bottomLeft:Radius.circular(20)),
                          ),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: SvgPicture.asset("assets/Group 3613.svg",height: 20,width: 20,),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 40.0),
                                child: Text("Gmail",style: TextStyle(color: Colors.black,fontSize: 16),),
                              ),


                            ],
                          ),
                        ),


                      ],
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
