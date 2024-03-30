part of 'assignmant_bloc.dart';

sealed class AssignmantState extends Equatable {
  const AssignmantState();
  
  @override
  List<Object> get props => [];
}

class AssignmentLoading extends AssignmantState {}

class AssignmentLoadSuccess extends AssignmantState {
  final List<Assignment> assignments;

  const AssignmentLoadSuccess([this.assignments = const []]);

  @override
  List<Object> get props => [assignments];
}

class AssignmentLoadFailure extends AssignmantState {}