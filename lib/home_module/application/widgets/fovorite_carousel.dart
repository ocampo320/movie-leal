import 'package:flutter/material.dart';
import 'package:move_app/models/tv_show.dart';
import 'package:move_app/services/tv_show_services.dart';

import '../../../utils/colors.dart';
import 'card_popular.dart';

class FavoriteCarousel extends StatelessWidget {
  const FavoriteCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TvShowServices.getTvShowPopular(),
      builder: (
        BuildContext context,
        AsyncSnapshot<TvShow> snapshot,
      ) {
        if (snapshot.hasData) {
          List<Widget> childrens = constructChildren(snapshot.data!);
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data?.results?.length,
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

  List<Widget> constructChildren(TvShow list) {
    List<Widget> markets = [];

    for (int i = 0; i < list.results!.length; i++) {
      markets.add(CardPopular(
        title: list.results![i].name!,
        image: 'https://image.tmdb.org/t/p/w500${list.results![i].posterPath}',
        stars: "0",
      ));
      markets.add(const SizedBox(
        height: 10,
      ));
    }

    return markets;
  }
}
