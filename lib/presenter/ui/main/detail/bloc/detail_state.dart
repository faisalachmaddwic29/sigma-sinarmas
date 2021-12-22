part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailNotFound extends DetailState {}

class DetailSuccess extends DetailState {
  final Meal meal;

  const DetailSuccess({required this.meal});
}

class DetailFail extends DetailState {
  final String? error;

  const DetailFail({this.error});
}
