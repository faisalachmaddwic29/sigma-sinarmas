import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sinarmas/data/food_repository_impl.dart';
import 'package:sinarmas/domain/models/remote/meal_response.dart';

part 'meals_event.dart';
part 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  MealsBloc() : super(MealsInitial()) {
    FoodRepositoryImpl foodRepository = FoodRepositoryImpl();

    on<MealsEvent>((event, emit) async {
      emit(MealsLoading());

      if (event is GetDataListMealsByFirstLetter) {
        MealsResponse mealsResponse =
            await foodRepository.getAllMealsByFirstLetter();

        if (mealsResponse.meals.isEmpty) {
          emit(MealsNotFound());
        } else {
          emit(MealsSuccess(listMeals: mealsResponse.meals));
        }
      }

      if (event is GetDataListMealsByCategory) {
        MealsResponse mealsResponse =
            await foodRepository.getMealsFilterByCategory(event.name);

        if (mealsResponse.meals.isEmpty) {
          emit(MealsNotFound());
        } else {
          emit(MealsSuccess(listMeals: mealsResponse.meals));
        }
      }
    });
  }
}
