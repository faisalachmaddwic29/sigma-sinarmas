import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sinarmas/data/food_repository_impl.dart';
import 'package:sinarmas/domain/models/remote/meal_response.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    FoodRepositoryImpl foodRepository = FoodRepositoryImpl();

    on<SearchEvent>((event, emit) async {
      emit(SearchLoading());
      if (event is GetDataMealsByName) {
        dynamic mealsResponse =
            await foodRepository.getMealsSearchByName(event.name);

        if (mealsResponse.meals == null) {
          emit(const SearchFail(error: 'Server is busy'));
        }
        if (mealsResponse.meals.isEmpty) {
          emit(SearchNotFound());
        } else {
          emit(SearchSuccess(listSearch: mealsResponse.meals));
        }
      }

      if (event is GetDataMealsNotFound) {
        emit(SearchNotFound());
      }
    });
  }
}
