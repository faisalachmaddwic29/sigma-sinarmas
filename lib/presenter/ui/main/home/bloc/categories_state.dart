part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesNotFound extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final List<Category> listCategories;

  const CategoriesSuccess({required this.listCategories});
}

class CategoriesFail extends CategoriesState {
  final String? error;

  const CategoriesFail({this.error});
}
