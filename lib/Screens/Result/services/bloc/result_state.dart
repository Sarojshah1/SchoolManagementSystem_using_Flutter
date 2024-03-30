part of 'result_bloc.dart';

sealed class ResultState extends Equatable {
  const ResultState();
  
  @override
  List<Object> get props => [];
}

class ResultInitial extends ResultState {}

class ResultLoadingState extends ResultState {}

class ResultLoadedState extends ResultState {
  final List<ResultModel> results;

  ResultLoadedState({required this.results});
  @override
  List<Object> get props => [results];
}
class ResultErrorState extends ResultState {
  final String error;

  ResultErrorState({required this.error});
  @override
  List<Object> get props => [error];
}