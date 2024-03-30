import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schoolmanagementsystem/Screens/AuthScreen/LoginScreen.dart';

import 'package:schoolmanagementsystem/Utils/Image_Constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    changescreen();
  }

  Future<void> changescreen() async {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return LoginScreen();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [
      Positioned(child: Image.asset(top),),
      Center(child: Image.asset(logo),),

     Positioned(child:  Stack(children: [Image.asset(splashbottom),Text("Developed by:Saroj Kumar Sah",style: TextStyle(fontSize: 14.w,fontWeight: FontWeight.w500),)],alignment: AlignmentDirectional.center,),left: 13.w,bottom: 0,)
    ],),);
  }
}
