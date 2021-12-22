part of 'meals_bloc.dart';

abstract class MealsEvent extends Equatable {
  const MealsEvent();

  @override
  List<Object> get props => [];
}

class GetDataListMealsByCategory extends MealsEvent {
  final String name;

  const GetDataListMealsByCategory({required this.name});
}

class GetDataListMealsByFirstLetter extends MealsEvent {}

class GetDataListRefresh extends MealsEvent {}
