import 'package:flutter/material.dart';

import '../colors.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.width,
    required this.disable,
    required this.onPressed,
    required this.title,
  });

  final double width;
  final String title;
  final bool disable;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF0C84FF),
          foregroundColor: Colors.white,
          padding: EdgeInsets.all(20),
        ),
        onPressed: disable ? null : onPressed,
        child: Text(
          title,
          style: const TextStyle(
            color: wColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
