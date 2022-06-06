import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TexInput extends StatelessWidget {
  const TexInput({Key? key, required this.textEditingController, required this.label})
      : super(key: key);

  final String label ;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return (TextField(
      decoration: InputDecoration(
           enabledBorder: const UnderlineInputBorder(
            borderSide:  BorderSide(color: Colors.white),
          ),
          hintText: label,
          hintStyle: const TextStyle(fontWeight: FontWeight.w300, color: Colors.white,)
      ),

          controller: textEditingController,

        ));

    }
}