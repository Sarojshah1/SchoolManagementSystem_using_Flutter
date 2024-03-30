part of 'attendance_bloc.dart';

sealed class AttendanceState extends Equatable {
  const AttendanceState();
  
  @override
  List<Object?> get props => [];
}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {}

class AttendanceLoaded extends AttendanceState {
  final List<AttendanceModel> attendanceList;
  final int totalDays;
  final int presentDays;
  final int absentDays;
  final double attendancePercentage;

  AttendanceLoaded( {required  this.attendanceList, required this.totalDays, required this.presentDays, required this.absentDays, required this.attendancePercentage}): assert(presentDays >= 0);

  @override
  List<Object?> get props => [attendanceList,totalDays, presentDays, absentDays, attendancePercentage];
}

class AttendanceError extends AttendanceState {
  final String errorMessage;

  AttendanceError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}