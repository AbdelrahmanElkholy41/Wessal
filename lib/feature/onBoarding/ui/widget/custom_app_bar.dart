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
      title: Row(
        children: [          Padding(
            padding: const EdgeInsets.only(top:40.0),
            child:   index>0 ?Image.asset('assets/images/arrow.png'): const SizedBox() ,
          ),
          Spacer(),
          Image.asset('assets/images/wessal.png', fit: BoxFit.fill,),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Color(0xff094173),
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}