// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sinarmas/data/food_repository_impl.dart';
import 'package:sinarmas/domain/models/remote/category_response.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    FoodRepositoryImpl foodRepository = FoodRepositoryImpl();

    on<CategoriesEvent>(
      (event, emit) async {
        emit(CategoriesLoading());

        if (event is GetDataListCategories) {
          CategoriesResponse categoriesResponse =
              await foodRepository.getAllCategories();

          if (categoriesResponse.categories.isEmpty) {
            emit(CategoriesNotFound());
          } else {
            emit(CategoriesSuccess(
                listCategories: categoriesResponse.categories));
          }
        }
      },
    );
  }
}
