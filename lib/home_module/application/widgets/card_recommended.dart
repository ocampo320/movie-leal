import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../widgets/button_move.dart';

class CardRecommended extends StatelessWidget {
  const CardRecommended(
      {Key? key,
      required this.image,
      required this.title,
      required this.stars,
      required this.vote})
      : super(key: key);
  final String image;
  final String title;
  final String stars;
  final dynamic vote;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.network(
                      image,
                      width: 130,
                      height: 190,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 160,
                          child: Text(
                            title,
                            style: TextStyle(
                                color: MoveColor.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 18),
                          ),
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
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'IMDb: $vote',
                          style: TextStyle(color: MoveColor.grey, fontSize: 10),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            ButtonMove(
                              fontSize: 15,
                              height: 35,
                              width: 110,
                              title: "Watch Now",
                              color: MoveColor.yellow,
                              onTap: () {},
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  color: MoveColor.grey,
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
