import 'package:flutter/material.dart';
import 'package:move_app/home_module/application/widgets/card_recommended.dart';
import 'package:move_app/services/tv_show_services.dart';

import '../../../models/recommended.dart';
import '../../../utils/colors.dart';

class RecommendedList extends StatelessWidget {
  const RecommendedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TvShowServices.getTvShowRecommended(),
      builder: (
        BuildContext context,
        AsyncSnapshot<Recommended> snapshot,
      ) {
        if (snapshot.hasData) {
          List<Widget> childrens = constructChildren(snapshot.data!);
          return ListView.builder(
            scrollDirection: Axis.vertical,
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

  List<Widget> constructChildren(Recommended list) {
    List<Widget> markets = [];

    for (int i = 0; i < list.results!.length; i++) {
      markets.add(CardRecommended(
        vote: list.results![i].voteAverage!,
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
