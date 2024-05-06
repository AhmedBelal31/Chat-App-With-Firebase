import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.prefixIcon,
      this.obscureText,
      this.keyboardType})
      : super(key: key);

  final String labelText;

  final String hintText;

  final IconData prefixIcon;

  final TextInputType? keyboardType;
  final bool? obscureText;

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
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextFormField(
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Icon(
                  prefixIcon,
                  color: Colors.white,
                ),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
