import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schoolmanagementsystem/Screens/SplashScreen.dart';

import 'Screens/AuthScreen/services/auth_services.dart';
import 'Screens/AuthScreen/services/bloc/authentication_bloc.dart';
// import 'Screens/Profile/Services/bloc/profile_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService(baseUrl: "http://localhost:7000/Student");
    return  MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(authService: authService),
        ),

        // Add more BlocProviders if needed
      ],
      child: ScreenUtilInit(
        builder: (_, child) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.green),
          home: child,
        ),
        designSize: const Size(375, 812),
        child: const SplashScreen(),
      ),
    );
  }
}


