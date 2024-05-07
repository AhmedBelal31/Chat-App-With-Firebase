import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomTextFormField extends StatelessWidget {


  final TextEditingController controller;

  final String labelText;

  final String hintText;

  final IconData prefixIcon;
  final TextInputType? keyboardType;
  final bool? obscureText;
  String? Function(String?)? validator;

  Function(String)? onChanged;

  Function(String)? onFieldSubmitted;
  AutovalidateMode? autoValidateMode;


  CustomTextFormField({
    super.key,
    required this.controller,
    this.validator,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText,
    this.keyboardType,
    this.onChanged,
    this.onFieldSubmitted,
    this.autoValidateMode
  });


  final kHintTextStyle = const TextStyle(
    color: Colors.white54,
    fontWeight: FontWeight.bold,
  );

  final kBoxDecorationStyle = BoxDecoration(
    color: const Color(0xFF6CA8F1),
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          textAlign: TextAlign.left,
          style: kLabelStyle,
        ),
        const SizedBox(height: 10),
        Container(
          // decoration: kBoxDecorationStyle,
          // height: 50,
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            validator: validator,
            autovalidateMode:autoValidateMode,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              // border: InputBorder.none,
              // contentPadding: const EdgeInsets.only(top: 14 ),
              enabledBorder: buildOutlineInputBorder(),
              disabledBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),
              border: buildOutlineInputBorder(),
              errorBorder: buildOutlineInputBorder(color: Colors.red.shade600),

              contentPadding:
              const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Icon(
                  prefixIcon,
                  color: Colors.white,
                ),
              ),
              hintText: hintText,
              errorStyle: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.w900),
              hintStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder({Color color = Colors.white}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.5),
        borderRadius: BorderRadius.circular(12.0));
  }
}
