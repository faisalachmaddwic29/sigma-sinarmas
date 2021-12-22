part of 'meals_bloc.dart';

abstract class MealsState extends Equatable {
  const MealsState();

  @override
  List<Object> get props => [];
}

class MealsInitial extends MealsState {}

class MealsLoading extends MealsState {}

class MealsNotFound extends MealsState {}

class MealsSuccess extends MealsState {
  final List<Meal> listMeals;

  const MealsSuccess({required this.listMeals});
}

class MealsFail extends MealsState {
  final String? error;

  const MealsFail({this.error});
}
