class ApiUrl {
  static const baseUrl = "https://www.themealdb.com/api/json/v1/1/";
  static const allCategories = "${baseUrl}categories.php";
  static const allMealsByFirstLetter = "${baseUrl}search.php?f=a";
  static const allMealsByName = "${baseUrl}search.php?s=";
  static const allMealsByCategory = "${baseUrl}filter.php?c=";
  static const mealById = "${baseUrl}lookup.php?i=";
}
