import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sinarmas/data/food_repository_impl.dart';
import 'package:sinarmas/domain/models/remote/meal_response.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    FoodRepositoryImpl foodRepository = FoodRepositoryImpl();

    on<DetailEvent>((event, emit) async {
      emit(DetailLoading());
      if (event is GetDataMealsById) {
        MealsResponse mealsResponse =
            await foodRepository.getMealFilterById(event.id);

        if (mealsResponse.meals.isEmpty) {
          emit(DetailNotFound());
        } else {
          emit(DetailSuccess(meal: mealsResponse.meals[0]));
        }
      }
    });
  }
}
