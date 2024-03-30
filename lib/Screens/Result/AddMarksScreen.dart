import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Utils/Image_Constant.dart';
import '../HomeScreen/TeacherHomeScreen.dart';

class AddMarks extends StatefulWidget {
  const AddMarks({Key? key}) : super(key: key);

  @override
  State<AddMarks> createState() => _AddMarksState();
}

class _AddMarksState extends State<AddMarks> {
  List<Student> students = List.generate(
    20,
        (index) => Student(id: index + 1, name: 'Student ${index + 1}', marks: 0),
  );
  List<TextEditingController> markControllers = [];
  @override
  void initState() {
    super.initState();
    // Initialize a TextEditingController for each student
    markControllers = List.generate(
      students.length,
          (index) => TextEditingController(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.blue700,
        leading: Image.asset(Examscreen),
        title: Text("ADD MARKS",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 24.w,color: Colors.white),),
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
                const Text("Marks")

              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(students[index].name),
                  subtitle: Text('ID: ${students[index].id}'),
                  trailing: SizedBox(
                    width: 60.w,
                    height: 40.h,
                    child: TextField(
                      controller: markControllers[index],
                      keyboardType: TextInputType.number,
                      decoration:const InputDecoration(
                        hintText: 'Marks',
                      ),
                    ),
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
              students[i].marks = int.parse(markControllers[i].text);
            }

            // For testing, print the marks
            for (var student in students) {
              print('${student.name}: ${student.marks}');
            }
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const TeacherHome();
            }));
          },
          child:const Icon(Icons.check),
        ),
    );
  }
}
class Student {
  final int id;
  final String name;
  int marks;

  Student({required this.id, required this.name, required this.marks});
}
