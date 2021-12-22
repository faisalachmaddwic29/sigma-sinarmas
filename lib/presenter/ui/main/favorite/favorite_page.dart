import 'package:flutter/material.dart';
import 'package:sinarmas/data/local/database_manager.dart';
import 'package:sinarmas/data/local/db/favorite/favorite_repository.dart';
import 'package:sinarmas/presenter/extension/color.dart';
import 'package:sinarmas/presenter/extension/fonts.dart';
import 'package:sinarmas/presenter/extension/margin_helper.dart';
import 'package:sinarmas/presenter/ui/main/detail/detail_page.dart';
import 'package:sinarmas/presenter/widgets/alert.dart';
import 'package:sinarmas/presenter/widgets/card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: RichText(
          maxLines: 2,
          text: TextSpan(
            text: 'My Favorite',
            style: SinarmasFonts().bold(),
            children: <TextSpan>[
              TextSpan(
                text: ' Foods',
                style: SinarmasFonts()
                    .bold()
                    .copyWith(color: SinarmasColors.primary),
              )
            ],
          ),
        ),
      );
    }

    Widget favoriteData() {
      return StreamBuilder(
          stream: FavoirteRepository().getAllFavoriteSteam(),
          builder: (context, AsyncSnapshot<List<Favorite>> snapshot) {
            if (!snapshot.hasData || snapshot.data!.isNotEmpty) {
              // ignore: avoid_unnecessary_containers
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        var data = snapshot.data![index].idMeal;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      id: data.toString(),
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: const Color(0xFF323247).withOpacity(0.1),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: cardWithImage(
                          context,
                          image: snapshot.data![index].strMealThumb,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  snapshot.data![index].strMeal,
                                  style: SinarmasFonts().semiBold(
                                    size: 15,
                                  ),
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data![index].strArea,
                                          style:
                                              SinarmasFonts().medium(size: 12),
                                        ).marginBottom(5),
                                        Text(
                                          snapshot.data![index].strCategory,
                                          style:
                                              SinarmasFonts().medium(size: 12),
                                        ).marginBottom(5),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      alertMakeSureDelete(
                                        context,
                                        content: 'Are you sure wanna delete ',
                                        actionYes: () {
                                          setState(() {
                                            FavoirteRepository().deleteFavorite(
                                                snapshot.data![index]);
                                            Navigator.pop(context);
                                          });
                                        },
                                        title: 'Delete meal',
                                        nama: snapshot.data![index].strMeal,
                                      );
                                    },
                                    icon: const Icon(Icons.delete),
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ).marginSymetric(horizontal: 20, vertical: 10);
                },
              );
            } else {
              return const Center(
                child: Text('No Favorites found'),
              );
            }
          });
    }

    return SafeArea(
      child: Column(
        children: [
          header(),
          Expanded(child: favoriteData()),
        ],
      ),
    );
  }
}
