import 'package:sinarmas/data/remote/base_remote.dart';
import 'package:sinarmas/data/remote/config/api_model.dart';

import 'package:sinarmas/domain/models/remote/meal_response.dart';
import 'package:sinarmas/domain/models/remote/category_response.dart';
import 'package:sinarmas/domain/repository/food_repository.dart';

class FoodRepositoryImpl implements FoodRepository {
  final remote = BaseRemote();

  @override
  Future<CategoriesResponse> getAllCategories() async {
    ApiModel response =
        await remote.apiGet('categories.php', queryParameters: {});

    CategoriesResponse categories = CategoriesResponse(categories: []);
    if (response.data['categories'] == null) {
      return categories;
    }
    if (response.status) {
      categories = CategoriesResponse.fromJson(response.data);
    }
    return categories;
  }

  @override
  Future<MealsResponse> getAllMealsByFirstLetter() async {
    ApiModel response =
        await remote.apiGet('search.php?f=a', queryParameters: {});

    MealsResponse meals = MealsResponse(meals: []);
    if (response.status) {
      meals = MealsResponse.fromJson(response.data);
    }
    return meals;
  }

  @override
  Future<MealsResponse> getMealFilterById(idMeals) async {
    ApiModel response =
        await remote.apiGet('lookup.php?i=$idMeals', queryParameters: {});

    MealsResponse meals = MealsResponse(meals: []);
    if (response.data['meals'] == null) {
      return meals;
    }
    if (response.status) {
      meals = MealsResponse.fromJson(response.data);
    }
    return meals;
  }

  @override
  Future<MealsResponse> getMealsFilterByCategory(idCategory) async {
    ApiModel response =
        await remote.apiGet('filter.php?c=$idCategory', queryParameters: {});

    MealsResponse meals = MealsResponse(meals: []);
    if (response.data['meals'] == null) {
      return meals;
    }
    if (response.status) {
      meals = MealsResponse.fromJson(response.data);
    }

    return meals;
  }

  @override
  Future<MealsResponse> getMealsSearchByName(nameMeals) async {
    ApiModel response =
        await remote.apiGet('search.php?s=$nameMeals', queryParameters: {});

    MealsResponse meals = MealsResponse(meals: []);
    if (response.data['meals'] == null) {
      return meals;
    }
    if (response.data['meals'] == null) {
      return meals;
    }
    if (response.status) {
      meals = MealsResponse.fromJson(response.data);
    }
    return meals;
  }
}
