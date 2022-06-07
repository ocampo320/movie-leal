import 'package:flutter/material.dart';

class ButtonMove extends StatelessWidget {
  const ButtonMove(
      {Key? key,
      required this.color,
      required this.title,
      required this.onTap,
      required this.width,
      required this.height,
      required this.fontSize})
      : super(key: key);
  final Color color;
  final String title;
  final VoidCallback onTap;
  final double width;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: fontSize,
              fontFamily: 'Gilroy'),
        )),
      ),
    );
  }
}
