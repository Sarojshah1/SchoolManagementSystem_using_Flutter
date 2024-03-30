import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schoolmanagementsystem/Screens/Homework/services/api_Services.dart';
import 'package:schoolmanagementsystem/Screens/Homework/services/bloc/assignmant_bloc.dart';
import 'package:schoolmanagementsystem/Screens/Homework/widgets/Homeworkcard.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Utils/Image_Constant.dart';

class StudentHomeworkScreen extends StatefulWidget {
  const StudentHomeworkScreen({Key? key}) : super(key: key);

  @override
  State<StudentHomeworkScreen> createState() => _StudentHomeworkScreenState();
}

class _StudentHomeworkScreenState extends State<StudentHomeworkScreen> {
  late AssignmantBloc _assignmentBloc;
  late AssignmentRepository _assignmentRepository;

  @override
  void initState() {
    super.initState();
    _assignmentRepository = AssignmentRepository();
    _assignmentBloc = AssignmantBloc(_assignmentRepository);
    _assignmentBloc.add(FetchAssignments());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.blue700,
        leading: Image.asset(homeworkscreen),
        title: Text(
          "HOMEWORK",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24.w,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upcoming Homework',
              style: TextStyle(
                fontSize: 20.w,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: BlocBuilder<AssignmantBloc, AssignmantState>(
                bloc: _assignmentBloc,
                builder: (context, state) {
                  if (state is AssignmentLoadSuccess) {
                    return ListView.builder(
                      itemCount: state.assignments.length,
                      itemBuilder: (context, index) {
                        final assignment = state.assignments[index];
                        return HomeworkCard(
                          subject: assignment.subject ?? '',
                          description: assignment.description ?? '',
                          dueDate: 'Due on: ${assignment.dueDate}',
                        );
                      },
                    );
                  } else if (state is AssignmentLoadFailure) {
                    return Text('Failed to load assignments.');
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
