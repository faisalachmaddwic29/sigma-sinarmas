import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sinarmas/presenter/extension/margin_helper.dart';
import 'package:sinarmas/presenter/ui/main/detail/detail_page.dart';
import 'package:sinarmas/presenter/widgets/card.dart';
import 'package:sinarmas/presenter/widgets/loading.dart';
import 'package:sinarmas/presenter/widgets/text_field.dart';

import 'bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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

    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      cardIcon(
                        context,
                        icon: Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 24,
                        padding: 12,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(
                        child: myTextFormFieldSearchWithBorder(
                          context,
                          hint: "Search Meals",
                          controller: _searchController,
                          capitalization: TextCapitalization.words,
                          onChange: (text) {
                            if (text.length >= 3) {
                              context.read<SearchBloc>().add(GetDataMealsByName(
                                  name: _searchController.text));
                            } else if (text.length == 0) {
                              context
                                  .read<SearchBloc>()
                                  .add(GetDataMealsNotFound());
                            }
                          },
                        ),
                      ),
                    ],
                  );
                },
              ).marginSymetric(vertical: 20, horizontal: 20),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchFail) {
                      return Center(
                        child: Text(state.error ?? ''),
                      );
                    }
                    if (state is SearchNotFound) {
                      return Container();
                    }
                    if (state is SearchSuccess) {
                      return meals(state.listSearch);
                    }
                    if (state is SearchLoading) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: loadingGrid(context, 6),
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
