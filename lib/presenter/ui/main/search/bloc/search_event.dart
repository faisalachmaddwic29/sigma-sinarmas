part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetDataMealsByName extends SearchEvent {
  final String name;

  const GetDataMealsByName({required this.name});
}

class GetDataMealsNotFound extends SearchEvent {}
