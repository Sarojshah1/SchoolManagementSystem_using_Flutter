import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schoolmanagementsystem/Screens/Attendance/classSingleton.dart';
import 'package:schoolmanagementsystem/Screens/Attendance/widgets/AttendanceCard.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Utils/Image_Constant.dart';
import 'apiservice/bloc/attendance_bloc.dart';

class StudentAttendanceScreen extends StatefulWidget {
  const StudentAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<StudentAttendanceScreen> createState() => _StudentAttendanceScreenState();
}

class _StudentAttendanceScreenState extends State<StudentAttendanceScreen> {

  late AttendanceBloc _AttendanceBloc;
  @override
  void initState() {
    super.initState();
    _AttendanceBloc = AttendanceBloc();
    _AttendanceBloc.add(FetchAttendance(AutofillHints.username));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.blue700,
        leading: Image.asset(attendanceScreen),
        title: Text("ATTENDANCE",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 24.w,color: Colors.white),),


      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Attendance Summary',
              style: TextStyle(
                fontSize: 20.w,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            BlocBuilder<AttendanceBloc, AttendanceState>( // Use BlocBuilder to listen for state changes
              bloc: _AttendanceBloc, // Pass AttendanceBloc instance
              builder: (context, state) {
                if (state is AttendanceLoaded) {
                  if (state.attendanceList.isEmpty) {
                    return Center(
                      child: Text(
                        "No results available.",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black87),
                      ),
                    );
                  }
                  return AttendanceCard(// Example class name, replace with actual class name
                    totalClasses: state.totalDays ?? 0, // Pass totalDays from state
                    attendedClasses: state.presentDays, // Pass presentDays from state
                    attendancePercentage:state.attendancePercentage , // Pass attendancePercentage from state
                  );
                } else if (state is AttendanceError) {
                  return Text('Error: ${state.errorMessage}');
                } else {
                  return CircularProgressIndicator(); // Show loading indicator while fetching data
                }
              },
            ),
            SizedBox(height: 10.h),
            // const AttendanceCard(
            //   className: "10",
            //   totalClasses: 20,
            //   attendedClasses: 18,
            //   attendancePercentage: 80,
            // ),

            // Add more AttendanceCard widgets for additional subjects
          ],
        ),
      ),
    );
  }
}
