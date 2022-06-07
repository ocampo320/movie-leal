import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({Key? key, required this.title, required this.left, required this.top}) : super(key: key);
  final String title;
  final double left;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Positioned(
        left: left,
        top: top,
        child: Center(
          child: Text(
           title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
