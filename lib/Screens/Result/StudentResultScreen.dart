import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schoolmanagementsystem/Screens/Result/services/bloc/result_bloc.dart';
import 'package:schoolmanagementsystem/Screens/Result/services/resultrepo.dart';
import 'package:schoolmanagementsystem/Utils/Image_Constant.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Utils/Image_Constant.dart';
import '../../Utils/Image_Constant.dart';
import '../../models/resultModel.dart'; // Importing Result from resultModel.dart
import 'Widgets/ResultCard.dart';

class StudentResult extends StatefulWidget {
  const StudentResult({Key? key}) : super(key: key);

  @override
  State<StudentResult> createState() => _StudentResultState();
}

class _StudentResultState extends State<StudentResult> {
  late ResultRepository _resultRepository;
  late ResultBloc _resultBloc;
  int? _highestTerm;

  @override
  void initState() {
    super.initState();
    _resultRepository = ResultRepository();
    _resultBloc = ResultBloc(repository: _resultRepository);
    _resultBloc.add(FetchResultData()); // Fetch fees for a specific class
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.blue700,
        leading: Image.asset(Examscreen),
        title: Text(
          "YOUR RESULTS",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24.w, color: Colors.white),
        ),
      ),
      body: BlocBuilder<ResultBloc, ResultState>(
        bloc: _resultBloc,
        builder: (context, state) {
          if (state is ResultLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ResultLoadedState) {
            if (state.results.isEmpty) {
              return Center(
                child: Text(
                  "No results available.",
                  style: TextStyle(fontSize: 16.sp, color: Colors.black87),
                ),
              );
            }
            _highestTerm = _findHighestTerm(state.results);
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Student Name: ${state.results.first.studentId?.fullname ?? ""}',
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    SizedBox(height: 20.h),
                    if (_highestTerm != null)
                      ...List.generate(_highestTerm!, (index) {
                        final termResults = state.results.where((result) => result.term == index + 1).toList();
                        return Card(
                          elevation: 4,
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Term ${index + 1}',
                                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.blue),
                                ),
                                SizedBox(height: 10.h),
                                ...termResults.map((result) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              result.subjectName ?? "",
                                              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black87),
                                            ),
                                          ),
                                          SizedBox(width: 20.w),
                                          Text(
                                            'Marks: ${result.marks ?? ""}',
                                            style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                    ],
                                  );
                                }).toList(),
                                SizedBox(height: 10.h),


                              ],
                            ),
                          ),
                        );
                      }),
                  ],
                ),
              ),
            );
          } else if (state is ResultErrorState) {
            return Center(
              child: Text(
                state.error,
                style: TextStyle(fontSize: 16.sp, color: Colors.red),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  int? _findHighestTerm(List<ResultModel> results) {
    int? highestTerm;
    for (var result in results) {
      if (result.term != null) {
        if (highestTerm == null || result.term! > highestTerm!) {
          highestTerm = result.term;
        }
      }
    }
    return highestTerm;
  }
}
