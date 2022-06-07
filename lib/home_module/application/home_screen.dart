import 'package:flutter/material.dart';
import 'package:move_app/home_module/application/widgets/fovorite_carousel.dart';
import 'package:move_app/home_module/application/widgets/recommended_list.dart';
import 'package:move_app/home_module/application/widgets/title_section.dart';
import 'package:move_app/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
                height: 380,
                color: Colors.black,
                child: const FavoriteCarousel()),
          ),
          const TitleSection(
            title: 'Popular',
            left: 20,
            top: 20,
          ),
          Positioned(
            left: 230,
            top: 400,
            child: Row(
              children: [
                Center(
                    child: Text(
                  "See All",
                  style: TextStyle(
                color: MoveColor.yellow,
                fontSize: 20,
                  ),
                )),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: MoveColor.yellow,
                  size: 20,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 430.0),
            child: Divider(
              color: MoveColor.grey,
              endIndent: 20,
              indent: 20,
            ),
          ),
          const TitleSection(
            title: 'Recommendations',
            top: 450,
            left: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 480),
            child:
                Container(color: Colors.black, child: const RecommendedList()),
          ),
        ],
      ),
    );
  }
}
