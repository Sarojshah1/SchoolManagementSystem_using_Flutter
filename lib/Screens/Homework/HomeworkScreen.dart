import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:schoolmanagementsystem/Screens/HomeScreen/TeacherHomeScreen.dart';
import 'package:schoolmanagementsystem/Utils/Image_Constant.dart';
import 'package:velocity_x/velocity_x.dart';

import '../AuthScreen/Widgets/customButton.dart';
import '../AuthScreen/Widgets/customTextfield.dart';

class TeacherHomeWorkScreen extends StatefulWidget {
  const TeacherHomeWorkScreen({Key? key}) : super(key: key);

  @override
  State<TeacherHomeWorkScreen> createState() => _TeacherHomeWorkScreenState();
}

class _TeacherHomeWorkScreenState extends State<TeacherHomeWorkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.blue700,
        leading: Image.asset(homeworkscreen),
        title: Text("HOMEWORK",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 24.w,color: Colors.white),),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the Homework Section!',
              style: TextStyle(
                fontSize: 24.w,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0.h),
            Text(
              'Dear Teachers,',
              style: TextStyle(
                fontSize: 18.w,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.0.h),
            Text(
              'We are excited to introduce the Homework Section, a dedicated space for managing and assigning homework efficiently. This feature allows you to:',
              style: TextStyle(fontSize: 13.w),
            ),
            SizedBox(height: 10.0.h),
            // List of features
           const FeatureItem(text: 'Assign and schedule homework tasks.'),
            const FeatureItem(text: 'Track upcoming deadlines and submissions.'),
           const FeatureItem(text: 'Provide feedback and grades for assignments.'),
            Gap(30.h),
            CustomTextfield(ispass: false,decoration: InputDecoration(hintText: "Class",border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),),
            Gap(30.h),
            CustomTextfield(ispass: false,decoration: InputDecoration(hintText: "Add Homework",border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),),
            Gap(30.h),
            Center(child: MyButton(ontap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const TeacherHome();
              }));
            },height: 60.h,width: 290.w,radius: 20.h.w,text: "Submit",))
          ],
        ),
      ),


    );
  }
}
class FeatureItem extends StatelessWidget {
  final String text;

  const FeatureItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check, color: Colors.green),
        SizedBox(width: 8.0.w),
        Expanded(child: Text(text)),
      ],
    );
  }
}