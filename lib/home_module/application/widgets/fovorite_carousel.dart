import 'package:flutter/material.dart';
import 'package:move_app/services/movie_services.dart';

import '../../../models/move.dart';
import '../../../utils/colors.dart';
import 'card_popular.dart';

class FavoriteCarousel extends StatelessWidget {
  const FavoriteCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MovieService.getAllMovies(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Movie>> snapshot,
      ) {
        if (snapshot.hasData) {
          List<Widget> childrens = constructChildren(snapshot.data!);
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int i) {
              return childrens[i];
            },
          );
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: CircularProgressIndicator(
                color: MoveColor.yellow,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        );
      },
    );
  }

  List<Widget> constructChildren(List<Movie> list) {
    List<Widget> markets = [];

    for (int i = 0; i < list.length; i++) {
      markets.add(CardPopular(
        title: list[i].title!,
        image: list[i].poster!,
        stars: "5",
      ));
      markets.add(const SizedBox(
        height: 10,
      ));
    }

    return markets;
  }
}
