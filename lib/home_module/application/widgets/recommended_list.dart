import 'package:flutter/material.dart';
import 'package:move_app/home_module/application/widgets/card_recommended.dart';
import 'package:move_app/services/tv_show_services.dart';

import '../../../models/recommended.dart';
import '../../../utils/colors.dart';
import '../../../widgets/button_move.dart';
import 'modal_detail.dart';

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
          List<Widget> childrens = constructChildren(snapshot.data!,context);
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

  List<Widget> constructChildren(Recommended list,BuildContext context) {
    List<Widget> markets = [];

    for (int i = 0; i < list.results!.length; i++) {
      markets.add(CardRecommended(
        onTap: (){

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
      //   ModalDetail(title: list.results![i].name!,image: 'https://image.tmdb.org/t/p/w500${list.results![i].posterPath}',value:list.results![i].voteAverage!);
        },
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
