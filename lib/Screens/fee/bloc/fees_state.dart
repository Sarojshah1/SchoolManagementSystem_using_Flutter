part of 'fees_bloc.dart';

sealed class FeesState extends Equatable {
  const FeesState();
  
  @override
  List<Object> get props => [];
}

class FeesInitial extends FeesState {}
class FeesLoading extends FeesState {}

class FeesLoaded extends FeesState {
final List<Fee> fees;

const FeesLoaded({required this.fees});

@override
List<Object> get props => [fees];
}

class FeesError extends FeesState {
final String message;

const FeesError({required this.message});

@override
List<Object> get props => [message];
}