import 'package:sinarmas/domain/models/remote/category_response.dart';
import 'package:sinarmas/domain/models/remote/meal_response.dart';

abstract class FoodRepository {
  Future<CategoriesResponse>? getAllCategories();
  Future<MealsResponse> getAllMealsByFirstLetter();
  Future<MealsResponse> getMealsSearchByName(nameMelas);
  Future<MealsResponse> getMealFilterById(idMeals);
  Future<MealsResponse> getMealsFilterByCategory(categoryMeals);
}
