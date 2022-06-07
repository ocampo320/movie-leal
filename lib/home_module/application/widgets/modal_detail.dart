import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../widgets/button_move.dart';

class ModalDetail extends StatelessWidget {
  const ModalDetail({Key? key, required this.image, required this.title, required this.value}) : super(key: key);
  final String image;

  final String title;
  final String value;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            width: 100,
            color: MoveColor.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network(image),
                const SizedBox(
                  height: 10,
                ),
                Text(title,style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'IMDb: $value',
                  style: TextStyle(color: MoveColor.grey, fontSize: 10),
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonMove(
                  fontSize: 15,
                  height: 45,
                  width: 180,
                  title: "Watch Now",
                  color: MoveColor.yellow,
                  onTap: () {

                  },
                ),
              ],
            ),
          );
        },
      );
    },
      child: Center(
        child: Container(
          child: const Text('showModalBottomSheet'),

        ),
      ),
    );
  }
}
