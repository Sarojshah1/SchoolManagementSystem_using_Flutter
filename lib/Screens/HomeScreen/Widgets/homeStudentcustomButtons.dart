import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:schoolmanagementsystem/Screens/Homework/HomeworkScreen.dart';

import 'package:schoolmanagementsystem/Screens/Routine/TeacherRoutine.dart';
import 'package:schoolmanagementsystem/Screens/fee/Fees.dart';
import 'package:velocity_x/velocity_x.dart';


import '../../../Utils/Image_Constant.dart';
import '../../Attendance/ClassAttendance.dart';

import '../../Attendance/StudentAttendanceScreen.dart';
import '../../Homework/StudentHomeworkScreen.dart';
import '../../Profile/Profile.dart';
import '../../Result/AddMarkstoclass.dart';
import '../../Result/StudentResultScreen.dart';

class StudentHomeButton extends StatelessWidget {
  const StudentHomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,

              mainAxisExtent: 190,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8.0
          ),itemCount: homelist.length, itemBuilder:(context, index){
        return  Column(children: [
          Container(
            height: 140.h,
            width: 125.w,
            decoration: BoxDecoration(color: Vx.green100,borderRadius: BorderRadius.circular(20.w.h)),
            child: Image.asset(homelist[index]),
          ),
          Text(homelisttitle[index],style: TextStyle(fontSize: 18.w,fontWeight: FontWeight.w500),)

        ],).onTap(() {
          if(index==1){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const StudentHomeworkScreen();
            })); }
          else if(index==0){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const StudentAttendanceScreen();
            }));

          }else if(index==2){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return StudentResult();
            }));

          }else if(index==3){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const TeacherRoutine();
            }));

          }else if(index==4){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const FeesScreen();
            }));

          }
          else if(index==5){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const ProfileScreen();
            }));

          }
        }


        );
      }),
    );
  }
}
