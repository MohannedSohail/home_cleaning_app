import 'package:flutter/material.dart';

int _value = 0;
int _btn_Value = 0;

Builder buildContainer(String img_path, String txt, int value) {
  return Builder(builder: (context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4.2,
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
            child:
                Text(txt, style: TextStyle(color: Colors.black, fontSize: 13)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: GestureDetector(
              // onTap: () => setState(() => _value = value),
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
  });
}

Container defaultButton(
    {double? width = double.infinity,
    Color color = const Color(0xff5C4DB1),
    bool isUpperCase = true,
    double? radius,
    required VoidCallback function,
    required String txt}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius!),
            topRight: Radius.circular(radius))),
    child: MaterialButton(
      onPressed: function,
      child: Text(isUpperCase ? txt.toUpperCase() : txt,
          style: TextStyle(color: Colors.white)),
    ),
  );
}

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  ValueChanged? onChange,
  required FormFieldValidator validator,
  required String labelTxt,
  required IconData prefixIcon,
  IconData? suffixIcon,
  bool obscureText = false,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: obscureText,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    validator: validator,
    decoration: InputDecoration(
        labelText: labelTxt,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        )),
  );
}
