import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Utils/Image_Constant.dart';
import '../HomeScreen/TeacherHomeScreen.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  List<Student> students = List.generate(
    20,
        (index) => Student(id: index + 1, name: 'Student ${index + 1}', isPresent: false),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.blue700,
        leading: Image.asset(attendanceScreen),
        title: Text("ATTENDANCE",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 24.w,color: Colors.white),),


      ),

      body: Column(
        children: [
          Container(
            color: Vx.blue200,
            padding: EdgeInsets.all(16.w.h),
            child: Row(
              children: [
                const Text("Student name"),
                SizedBox(width: 200.w,),
                const Text("Present")


              ],
            ),
          ),
          Expanded(
            child: ListView.builder(

              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Vx.gray100,


                  horizontalTitleGap: 10,

                  title: Text(students[index].name),
                  subtitle: Text('ID: ${students[index].id}'),
                  trailing: Checkbox(
                    value: students[index].isPresent,
                    onChanged: (value) {
                      setState(() {
                        students[index].isPresent = value!;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < students.length; i++) {
            if (students[i].isPresent) {
              print('${students[i].name}: Present');
            } else {
              print('${students[i].name}: absent');
            }
          }
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const TeacherHome();
          }));
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
class Student {
  final int id;
  final String name;
  bool isPresent;

  Student({required this.id, required this.name, required this.isPresent});
}
