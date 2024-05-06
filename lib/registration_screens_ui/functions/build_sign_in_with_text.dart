import 'package:flutter/material.dart';

Widget buildSignInWithText() => const Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            '- OR -',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
          ),
          SizedBox(height: 15),
          Text(
            'Sign In With ',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ],
      ),
    );
