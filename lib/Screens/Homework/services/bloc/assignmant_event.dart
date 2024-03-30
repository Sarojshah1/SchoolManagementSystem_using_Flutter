part of 'assignmant_bloc.dart';

sealed class AssignmantEvent extends Equatable {
  const AssignmantEvent();

  @override
  List<Object> get props => [];
}
class FetchAssignments extends AssignmantEvent {}