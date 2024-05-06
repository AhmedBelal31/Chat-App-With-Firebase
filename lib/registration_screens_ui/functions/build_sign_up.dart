import 'package:flutter/material.dart';
import 'navigateTo.dart';

Widget buildHaveAccount(context,
        {required String haveAnAccount,
        required String signInOrUp,
        required page}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 10),
        Text(
          haveAnAccount,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              navigateTo(context, page);
            },
            child: Text(
              signInOrUp,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
