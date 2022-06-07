import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../widgets/button_move.dart';

class CardPopular extends StatelessWidget {
  const CardPopular(
      {Key? key, required this.image, required this.title, required this.stars, required this.onTap})
      : super(key: key);
  final String image;
  final String title;
  final String stars;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(image, scale: 2),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: MoveColor.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: MoveColor.grey,
                        size: 18,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
