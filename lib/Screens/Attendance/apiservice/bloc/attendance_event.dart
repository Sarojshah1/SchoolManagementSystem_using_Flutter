part of 'attendance_bloc.dart';

sealed class AttendanceEvent extends Equatable {
  const AttendanceEvent();

  @override
  List<Object> get props => [];
}

class FetchAttendance extends AttendanceEvent {
  final String username;

  FetchAttendance(this.username);

  @override
  List<Object> get props => [username];
}