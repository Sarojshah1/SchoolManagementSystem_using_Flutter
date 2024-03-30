part of 'result_bloc.dart';

sealed class ResultEvent extends Equatable {
  const ResultEvent();

  @override
  List<Object> get props => [];
}
class FetchResultData extends ResultEvent {}