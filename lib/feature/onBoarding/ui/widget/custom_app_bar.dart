import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key, required this.index,
  });
final int index;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,

      leading: index > 0
          ? IconButton(
        icon: Image.asset(
          'assets/images/arrow.png',
          height: 32,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      )
          : null,

      title: Image.asset(
        'assets/images/wessal.png',
        height: 32,
        fit: BoxFit.contain,
      ),

      actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Skip',
            style: TextStyle(
              color: Color(0xff094173),
              decoration: TextDecoration.underline,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );

  }
}