import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../models/Attendance_model.dart';
import '../../classSingleton.dart';
import '../api_service.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {

  AttendanceBloc() : super(AttendanceInitial()){
    on<FetchAttendance>(_fetchAttendance);
  }
  void _fetchAttendance(FetchAttendance Event,Emitter<AttendanceState> emit)async{
    print("hello from attendance bloc");
    if (Event is FetchAttendance) {
      emit(AttendanceLoading());
      try {
        final List<AttendanceModel> attendanceList = await AttendanceService.getAttendance();
        final filteredAttendanceList = attendanceList.where((attendance) => attendance.className == ClassNameManager().className).toList();
        int totalDays = filteredAttendanceList.length;
        int presentDays = filteredAttendanceList.where((attendance) => attendance.isPresent==true).length;
        int absentDays = totalDays - presentDays;
        double attendancePercentage = (presentDays / totalDays) * 100;
        for (AttendanceModel attendance in attendanceList) {
          print('Student ID: ${attendance.studentId}');
          print('Class Name: ${attendance.className}');
          print('Date: ${attendance.date}');
          print('Is Present: ${attendance.isPresent}');
          print('------------------------------');
        }


        emit(AttendanceLoaded(
          attendanceList: filteredAttendanceList,
          totalDays: totalDays,
          presentDays: presentDays,
          absentDays: absentDays,
          attendancePercentage: attendancePercentage,
        ));
      } catch (error) {
        emit(AttendanceError(error.toString()));
      }
    }
  }

}
