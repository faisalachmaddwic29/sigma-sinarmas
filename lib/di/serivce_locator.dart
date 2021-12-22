import 'package:get_it/get_it.dart';
import 'package:sinarmas/data/local/database_manager.dart';
import 'package:sinarmas/data/local/db/favorite/favorite_dao.dart';
import 'package:sinarmas/data/remote/config/dio_module.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerSingleton(DioModule());
  locator.registerSingleton(openConnection());
  locator.registerSingleton(FavoritesDao);
}
