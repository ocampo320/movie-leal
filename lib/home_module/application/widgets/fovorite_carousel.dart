import 'package:flutter/material.dart';
import 'package:move_app/models/tv_show.dart';
import 'package:move_app/services/tv_show_services.dart';

import '../../../utils/colors.dart';
import '../../../widgets/button_move.dart';
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
          List<Widget> childrens = constructChildren(snapshot.data!,context);
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

  List<Widget> constructChildren(TvShow list,BuildContext context) {
    List<Widget> markets = [];

    for (int i = 0; i < list.results!.length; i++) {
      markets.add(CardPopular(
        onTap:() {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 500,
                width: 100,
                color: MoveColor.onSurface,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container( width:500, height:280, child: Image.network('https://image.tmdb.org/t/p/w500${list.results![i].posterPath}')),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(list.results![i].name!,style: const TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'IMDb: ${list.results![i].voteAverage!}',
                      style: TextStyle(color: MoveColor.grey, fontSize: 13),
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
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            },
          );
        },

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
