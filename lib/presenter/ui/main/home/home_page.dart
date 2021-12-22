import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sinarmas/presenter/extension/color.dart';

import 'package:sinarmas/presenter/extension/fonts.dart';
import 'package:sinarmas/presenter/extension/margin_helper.dart';
import 'package:sinarmas/presenter/ui/main/detail/detail_page.dart';
import 'package:sinarmas/presenter/ui/main/home/bloc/categories_bloc.dart';
import 'package:sinarmas/presenter/ui/main/home/bloc/meals_bloc.dart';
import 'package:sinarmas/presenter/widgets/card.dart';
import 'package:sinarmas/presenter/widgets/image.dart';
import 'package:sinarmas/presenter/widgets/loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? indexCategory;

  Widget header() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
        maxLines: 2,
        text: TextSpan(
          text: 'Welcoming To\nFavorite',
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

  Widget categories(data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: SinarmasFonts().bold().copyWith(fontSize: 22),
        ).marginLeft(25),
        const SizedBox(height: 15),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 25),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) => BlocBuilder<MealsBloc, MealsState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      indexCategory = index;
                    });
                    context.read<MealsBloc>().add(GetDataListMealsByCategory(
                        name: data[indexCategory].strCategory));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: indexCategory == index
                          ? SinarmasColors.primary
                          : Colors.transparent,
                      border: Border.all(
                          color: indexCategory == index
                              ? SinarmasColors.primary
                              : SinarmasColors.grey,
                          width: 0.5),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: myCachedNetworkImage(
                              data[index].strCategoryThumb),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${data[index].strCategory}',
                          style: indexCategory == index
                              ? SinarmasFonts().bold().copyWith(
                                  fontSize: 13, color: SinarmasColors.text)
                              : SinarmasFonts()
                                  .regular()
                                  .copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                  ).marginRight(16),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget meals(data) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: StaggeredGridView.countBuilder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => baseCard(
          context,
          child: singleCard(
            context,
            padding: const EdgeInsets.all(0),
            image: data[index].strMealThumb,
            title: data[index].strMeal,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            id: data[index].idMeal,
                          )));
            },
          ),
        ),
        staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header().marginBottom(25),
          BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesLoading) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: loadingRow(context, height: 28),
                ).marginBottom(20);
              }
              if (state is CategoriesSuccess) {
                return SizedBox(
                    height: 106,
                    child: categories(state.listCategories).marginBottom(25));
              }

              return Container();
            },
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     child: const Text('back')),
          Expanded(child: BlocBuilder<MealsBloc, MealsState>(
            builder: (context, state) {
              if (state is MealsLoading) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: loadingGrid(context, 4),
                );
              }

              if (state is MealsSuccess) {
                return RefreshIndicator(
                  color: SinarmasColors.primary,
                  onRefresh: () async {
                    if (indexCategory == null) {
                      context
                          .read<MealsBloc>()
                          .add(GetDataListMealsByFirstLetter());
                    } else {
                      var data = (context.read<CategoriesBloc>().state
                              as CategoriesSuccess)
                          .listCategories;

                      context.read<MealsBloc>().add(GetDataListMealsByCategory(
                          name: data[indexCategory ?? 0].strCategory));
                    }
                  },
                  displacement: 10,
                  child: meals(state.listMeals),
                );
              }

              return Container();
            },
          )),
        ],
      ),
    );
  }
}
