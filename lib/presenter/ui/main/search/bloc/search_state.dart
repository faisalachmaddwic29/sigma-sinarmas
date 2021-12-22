part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchNotFound extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Meal> listSearch;

  const SearchSuccess({required this.listSearch});
}

class SearchFail extends SearchState {
  final String? error;

  const SearchFail({this.error});
}
