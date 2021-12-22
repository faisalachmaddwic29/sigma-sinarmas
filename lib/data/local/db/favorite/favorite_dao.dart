import 'package:moor/moor.dart';
import 'package:sinarmas/domain/models/local/favorites_table.dart';

import '../../database_manager.dart';

part 'favorite_dao.g.dart';

@UseDao(tables: [Favorites])
class FavoritesDao extends DatabaseAccessor<AppDatabase>
    with _$FavoritesDaoMixin {
  FavoritesDao(AppDatabase db) : super(db);

  // Queries
  // Get all Meals
  Future insertFavorite(Favorite favorite) =>
      into(favorites).insert(favorite, mode: InsertMode.insertOrReplace);
  Future updateFavorite(Favorite favorite) =>
      update(favorites).replace(favorite);
  Future deleteFavorite(Favorite favorite) =>
      delete(favorites).delete(favorite);

  Future deleteAllFavorite() => delete(favorites).go();
  Future<List<Favorite>> getAllFavorites() => select(favorites).get();
  Stream<List<Favorite>> getAllFavoritesStream() => select(favorites).watch();
}
