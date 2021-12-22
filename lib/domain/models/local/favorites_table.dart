import 'package:moor/moor.dart';

class Favorites extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idMeal => integer()();
  TextColumn get strCategory => text()();
  TextColumn get strArea => text()();
  TextColumn get strMeal => text()();
  TextColumn get strMealThumb => text()();
}
