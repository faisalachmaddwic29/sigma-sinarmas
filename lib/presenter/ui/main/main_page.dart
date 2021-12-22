import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinarmas/presenter/extension/color.dart';
import 'package:sinarmas/presenter/extension/margin_helper.dart';
import 'package:sinarmas/presenter/ui/main/search/search_page.dart';

import 'favorite/favorite_page.dart';
import 'home/bloc/categories_bloc.dart';
import 'home/bloc/meals_bloc.dart';
import 'home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  bool keepAlive = false;
  int currentIndex = 0;

  Future doAsyncStuff() async {
    keepAlive = true;
    updateKeepAlive();
    // Keeping alive...

    await Future.delayed(const Duration(seconds: 10));

    keepAlive = false;
    updateKeepAlive();
    // Can be disposed whenever now.
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget cardButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SearchPage()));
          // Navigator.of(context).pushNamed('/cart');
        },
        backgroundColor: SinarmasColors.primary,
        child: const Icon(
          Icons.search,
          color: SinarmasColors.text,
        ),
      );
    }

    Widget customButtonNav() {
      return Material(
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          child: BottomAppBar(
            // elevation: 1,
            color: Colors.transparent,
            shape: const CircularNotchedRectangle(),
            notchMargin: 16,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              // showUnselectedLabels: false,
              // showSelectedLabels: false,
              selectedItemColor: SinarmasColors.primary,
              backgroundColor: SinarmasColors.text,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: currentIndex == 0
                        ? SinarmasColors.primary
                        : SinarmasColors.grey,
                  ).marginOnly(top: 15, bottom: 10, right: 20, left: 20),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    color: currentIndex == 1
                        ? SinarmasColors.primary
                        : SinarmasColors.grey,
                  ).marginOnly(top: 15, bottom: 10, right: 20, left: 20),
                  label: 'Favorite',
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        // break;
        case 1:
          return const FavoritePage();
        // break;
        default:
          return const HomePage();
      }
    }

    return SafeArea(
      left: false,
      top: false,
      right: false,
      bottom: true,
      minimum: const EdgeInsets.symmetric(horizontal: 0),
      maintainBottomViewPadding: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        floatingActionButton: cardButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: customButtonNav(),
        extendBody: true,
        // extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            const SizedBox(
              width: double.infinity,
              child: Image(
                // fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fill,
              ),
            ),
            MultiBlocProvider(providers: [
              BlocProvider<CategoriesBloc>(
                  create: (context) =>
                      CategoriesBloc()..add(GetDataListCategories())),
              BlocProvider<MealsBloc>(
                  create: (context) =>
                      MealsBloc()..add(GetDataListMealsByFirstLetter())),
            ], child: body()),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => keepAlive;
}
