part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class GetDataMealsById extends DetailEvent {
  final String id;

  const GetDataMealsById({required this.id});
}
