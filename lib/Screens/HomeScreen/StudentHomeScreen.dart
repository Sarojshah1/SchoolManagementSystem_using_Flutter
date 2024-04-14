import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gap/gap.dart';
import 'package:schoolmanagementsystem/Screens/AuthScreen/LoginScreen.dart';

import '../../Utils/Image_Constant.dart';
import 'Widgets/HomeCustomButton.dart';
import 'Widgets/homeStudentcustomButtons.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Implement logout functionality here
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Stack(children: [
              Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.white),

                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                    child: Image.asset(
                      profilepic,
                      fit: BoxFit.fill,
                    ) // Provide a default asset path
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                        color: Colors.green),
                    child: Center(
                      child: IconButton(
                        onPressed: () {

                        },
                        icon: Icon(Icons.edit,color: Colors.white,size: 20),
                        color: Colors.white,
                      ),
                    ),
                  ))
            ]),
          ),
          const Gap(15),
          Container(height: 150,width: 380,decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20),),child: Column(
            children: [
              Text("Welcome Message",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16.w,),),
              Text("Welcome to our Student Portal App – your gateway to a world of knowledge and academic excellence! We're thrilled to have you on board. Dive into a seamless learning experience, access course materials, stay connected with your peers, and unlock a plethora of resources to fuel your educational journey. Your success starts here, and we're here to support you every step of the way. Let the learning adventure begin!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 11.w,))
            ],
          ),),
          Gap(30.h),

          const StudentHomeButton()


        ],

      ),
    );
  }
}
