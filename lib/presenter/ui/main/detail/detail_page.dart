import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinarmas/data/local/database_manager.dart';
import 'package:sinarmas/data/local/db/favorite/favorite_repository.dart';
import 'package:sinarmas/presenter/extension/color.dart';
import 'package:sinarmas/presenter/extension/fonts.dart';
import 'package:sinarmas/presenter/ui/main/detail/bloc/detail_bloc.dart';
import 'package:sinarmas/presenter/widgets/alert.dart';
import 'package:sinarmas/presenter/widgets/button.dart';
import 'package:sinarmas/presenter/widgets/card.dart';
import 'package:sinarmas/presenter/widgets/image.dart';
import 'package:sinarmas/presenter/extension/margin_helper.dart';
import 'package:sinarmas/presenter/widgets/loading.dart';

class DetailPage extends StatefulWidget {
  final String id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Widget ingradient(data) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Ingredient',
              style: SinarmasFonts().semiBold().copyWith(fontSize: 16),
            ).marginBottom(5),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            bullets().marginRight(5),
                            Text(
                              data.strIngredient1 ?? '',
                              style: SinarmasFonts().regular().copyWith(
                                    color: SinarmasColors.grey,
                                    fontSize: 13,
                                  ),
                            ).marginRight(3),
                            Text(
                              data.strMeasure1 ?? '',
                              style: SinarmasFonts().light().copyWith(
                                    color: SinarmasColors.grey,
                                    fontSize: 10,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            bullets().marginRight(5),
                            Text(
                              data.strIngredient2 ?? '',
                              style: SinarmasFonts().regular().copyWith(
                                    color: SinarmasColors.grey,
                                    fontSize: 13,
                                  ),
                            ).marginRight(3),
                            Text(
                              data.strMeasure2 ?? '',
                              style: SinarmasFonts().light().copyWith(
                                    color: SinarmasColors.grey,
                                    fontSize: 10,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            bullets().marginRight(5),
                            Text(
                              data.strIngredient3 ?? '',
                              style: SinarmasFonts().regular().copyWith(
                                    color: SinarmasColors.grey,
                                    fontSize: 13,
                                  ),
                            ).marginRight(3),
                            Text(
                              data.strMeasure3 ?? '',
                              style: SinarmasFonts().light().copyWith(
                                    color: SinarmasColors.grey,
                                    fontSize: 10,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            bullets().marginRight(5),
                            Text(
                              data.strIngredient4 ?? '',
                              style: SinarmasFonts().regular().copyWith(
                                    color: SinarmasColors.grey,
                                    fontSize: 13,
                                  ),
                            ).marginRight(3),
                            Text(
                              data.strMeasure4 ?? '',
                              style: SinarmasFonts().light().copyWith(
                                    color: SinarmasColors.grey,
                                    fontSize: 10,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            bullets().marginRight(5),
                            Text(
                              data.strIngredient5 ?? '',
                              style: SinarmasFonts().regular().copyWith(
                                    color: SinarmasColors.grey,
                                    fontSize: 13,
                                  ),
                            ).marginRight(3),
                            Text(
                              data.strMeasure5 ?? '',
                              style: SinarmasFonts().light().copyWith(
                                    color: SinarmasColors.grey,
                                    fontSize: 10,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            bullets().marginRight(5),
                            Text(
                              data.strIngredient6 ?? '',
                              style: SinarmasFonts().regular().copyWith(
                                    color: SinarmasColors.grey,
                                    fontSize: 13,
                                  ),
                            ).marginRight(3),
                            Text(
                              data.strMeasure6 ?? '',
                              style: SinarmasFonts().light().copyWith(
                                    color: SinarmasColors.grey,
                                    fontSize: 10,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            bullets().marginRight(5),
                            Text(
                              data.strIngredient7 ?? '',
                              style: SinarmasFonts().regular().copyWith(
                                    color: SinarmasColors.grey,
                                    fontSize: 13,
                                  ),
                            ).marginRight(3),
                            Text(
                              data.strMeasure7 ?? '',
                              style: SinarmasFonts().light().copyWith(
                                    color: SinarmasColors.grey,
                                    fontSize: 10,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            bullets().marginRight(5),
                            Text(
                              data.strIngredient8 ?? '',
                              style: SinarmasFonts().regular().copyWith(
                                    color: SinarmasColors.grey,
                                    fontSize: 13,
                                  ),
                            ).marginRight(3),
                            Text(
                              data.strMeasure8 ?? '',
                              style: SinarmasFonts().light().copyWith(
                                    color: SinarmasColors.grey,
                                    fontSize: 10,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ).marginBottom(5),
      );
    }

    Widget instruction(data) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Instruction',
            style: SinarmasFonts().semiBold().copyWith(fontSize: 16),
          ).marginBottom(5),
          Text(
            data.strInstructions ?? '',
            style: SinarmasFonts().regular().copyWith(
                  color: SinarmasColors.grey,
                ),
            textAlign: TextAlign.justify,
          ),
        ],
      );
    }

    return BlocProvider<DetailBloc>(
      create: (context) => DetailBloc()..add(GetDataMealsById(id: widget.id)),
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomAppBar(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: const Color(0xFF323247).withOpacity(0.1),
                offset: const Offset(0, -4),
                blurRadius: 20,
              )
            ]),
            padding: const EdgeInsets.all(20),
            height: 90,
            child: BlocBuilder<DetailBloc, DetailState>(
              builder: (context, state) {
                if (state is DetailSuccess) {
                  return primaryButton(
                    context,
                    text: 'Add To Favorite',
                    onTap: () {
                      FavoirteRepository().insertFavorite(Favorite(
                          id: int.tryParse(state.meal.idMeal ?? '0') ?? 0,
                          idMeal: int.tryParse(state.meal.idMeal ?? '0') ?? 0,
                          strCategory: state.meal.strCategory ?? '',
                          strArea: state.meal.strArea ?? '',
                          strMeal: state.meal.strMeal ?? '',
                          strMealThumb: state.meal.strMealThumb ?? ''));

                      alertCompleteProfile(context, onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                      // Navigator.pop(context);
                    },
                  );
                }
                return primaryButton(
                  context,
                  text: 'Add To Favorite',
                );
              },
            ),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<DetailBloc, DetailState>(
            builder: (context, state) {
              if (state is DetailLoading) {
                return SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          myShimmer(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 2.5,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                cardIcon(
                                  context,
                                  icon: Icons.arrow_back_ios_new_rounded,
                                  color: Colors.white,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                // cardIcon(
                                //   context,
                                //   icon: Icons.more_vert_sharp,
                                //   color: Colors.white,
                                //   onTap: () {
                                //     Navigator.pop(context);
                                //   },
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ).marginBottom(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: loadingRow(context, data: 1, height: 28),
                      ).marginBottom(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: loadingRow(context, height: 28, data: 2),
                      ).marginBottom(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: loadingGrid(context, 2),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: loadingRow(context, height: 28),
                      ).marginBottom(20),
                    ],
                  ),
                );
              }
              if (state is DetailSuccess) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2.5,
                            child: myCachedNetworkImage(state.meal.strMealThumb,
                                borderRadius: 10),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    blurRadius: 8,
                                    color: SinarmasColors.grey,
                                    offset: Offset(0.5, 2),
                                  ),
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                cardIcon(
                                  context,
                                  icon: Icons.arrow_back_ios_new_rounded,
                                  color: Colors.white,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                // cardIcon(
                                //   context,
                                //   icon: Icons.more_vert_sharp,
                                //   color: Colors.white,
                                //   onTap: () {
                                //     Navigator.pop(context);
                                //   },
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ).marginBottom(15),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.meal.strMeal ?? '',
                              style: SinarmasFonts().bold().copyWith(
                                fontSize: 20,
                                color: SinarmasColors.black,
                                shadows: <Shadow>[
                                  const Shadow(
                                    offset: Offset(0.5, 1.2),
                                    blurRadius: 2.0,
                                    color: SinarmasColors.text,
                                  ),
                                ],
                              ),
                            ).marginBottom(5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.meal.strCategory ?? '',
                                  style: SinarmasFonts().regular().copyWith(
                                        color: SinarmasColors.grey,
                                      ),
                                ),
                                Row(
                                  children: [
                                    const Image(
                                      image:
                                          AssetImage('assets/images/maps.png'),
                                      width: 24,
                                      height: 24,
                                      fit: BoxFit.fill,
                                    ),
                                    // const Icon(
                                    //   Icons.map,
                                    //   color: SinarmasColors.primary,
                                    // ),
                                    Text(
                                      state.meal.strArea ?? '',
                                      style: SinarmasFonts().regular().copyWith(
                                            color: SinarmasColors.grey,
                                          ),
                                    ),
                                  ],
                                )
                              ],
                            ).marginBottom(5),
                            ingradient(state.meal).marginBottom(5),
                            instruction(state.meal),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
