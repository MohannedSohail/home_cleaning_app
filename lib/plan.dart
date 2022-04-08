import 'package:flutter/material.dart';

class Plan extends StatefulWidget {
  const Plan({Key? key}) : super(key: key);

  @override
  State<Plan> createState() => _PlanState();
}

class _PlanState extends State<Plan> {

  int _value = 0;
  int _btn_Value = 0;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Container buildContainer(String img_path, String txt, int value) {
    return Container(
      height: MediaQuery.of(context).size.height/4.2,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 5, left: 5),
            child: Image.asset(img_path, height: 130),
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xffDFDEFF),
                borderRadius: BorderRadius.circular(30)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(txt, style: TextStyle(color: Colors.black, fontSize: 13)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: GestureDetector(
              onTap: () => setState(() => _value = value),
              child: _value == value
                  ? const Icon(
                Icons.check_circle,
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
            ),
          ),
        ],
      ),
    );
  }

}


