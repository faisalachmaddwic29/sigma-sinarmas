import 'package:sinarmas/di/serivce_locator.dart';

import '../../database_manager.dart';

class FavoirteRepository {
  Future insertFavorite(Favorite favorite) async {
    await locator<AppDatabase>().favoritesDao.insertFavorite(favorite);
  }

  Future deleteFavorite(Favorite favorite) async {
    await locator<AppDatabase>().favoritesDao.deleteFavorite(favorite);
  }

  Future deleteAllFavorite() async {
    await locator<AppDatabase>().favoritesDao.deleteAllFavorite();
  }

  Future<List<Favorite>> getAllFavorite() async {
    return await locator<AppDatabase>().favoritesDao.getAllFavorites();
  }

  Stream<List<Favorite>> getAllFavoriteSteam() {
    return locator<AppDatabase>().favoritesDao.getAllFavoritesStream();
  }
}
