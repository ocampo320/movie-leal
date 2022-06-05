import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin(
      {Key? key,
      required this.color,
      required this.title,
      required this.function})
      : super(key: key);
  final Color color;
  final String title;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 45,
      decoration: BoxDecoration(
       
          color:color,
          borderRadius: BorderRadius.circular(35.0),
        ),
      child: Center(child: Text(title,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 20,fontFamily: 'Gilroy'),)),);
  
  }
}
