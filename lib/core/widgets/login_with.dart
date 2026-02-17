import 'package:flutter/material.dart';

class LoginWith extends StatelessWidget {
  const LoginWith({
    super.key, required this.text, required this.image,
  });
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        // Google Sign In Logic
      },
      icon: Image.asset(
        image,
        height: 22,
      ),
      label:  Text(
        text,
        style: TextStyle(
          color: Color(0xff094173),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: OutlinedButton.styleFrom(

        minimumSize: const Size(double.infinity, 55),
        side: const BorderSide(
          color: Color(0xff676BFF),
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
