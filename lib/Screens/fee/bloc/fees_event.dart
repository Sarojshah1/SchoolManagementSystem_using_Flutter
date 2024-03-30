part of 'fees_bloc.dart';

sealed class FeesEvent extends Equatable {
  const FeesEvent();

  @override
  List<Object> get props => [];
}
class FetchFees extends FeesEvent {
}