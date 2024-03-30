import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../models/StudentProfileModel.dart';
import '../../Attendance/classSingleton.dart';
import '../../fee/PaymentServices/useridsingleton.dart';


class AuthService {
  final String baseUrl;

  AuthService({required this.baseUrl});

  Future<String> login({required String username, required String password}) async {
    print(baseUrl);
    final url = Uri.parse('http://192.168.56.1:7000/Student/login');
    final url1 = Uri.parse('http://192.168.56.1:7000/Student/$username');
    print(url);
    try {
      final response = await http.post(
        url,
        body: jsonEncode({"username": username, "password": password}),
          headers: {
            'Content-Type': 'application/json',
          }
      );
      final user = await http.get(url1);
      print("hello");
      print(user.body);
      print(response.body);

      final Map<String, dynamic> data = json.decode(user.body);
      final studentProfileModel = StudentProfileModel.fromJson(data);
      String? className=studentProfileModel.className;
      String? StudentId=studentProfileModel.id;
      print(studentProfileModel.fullname);
      ClassNameManager().setClassName(className);
      StudentIdManager().setStudentId(StudentId);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String token = responseData['token'];
        final Map<String, dynamic> userData = responseData['user'];

        print('Login successful!');

        return token;


      } else {
        throw Exception('Failed to login (Status code: ${response.statusCode})');
      }
    } catch (error) {
      // print(error);
      throw LoginException(error.toString());
    }
  }
}

class LoginException implements Exception {
  final String message;

  LoginException(this.message);
}