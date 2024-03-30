import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../models/Attendance_model.dart';
import '../../Profile/Services/detailssingleton.dart';

class AttendanceService {

  static Future<List<AttendanceModel>> getAttendance() async {
    print("hello from attendance service");
    final username = UserManager().username;
    final response = await http.get(Uri.parse('http://192.168.56.1:7000/studentattendance/$username'));
    print(response.body);
    if (response.statusCode == 200) {
      print(response.statusCode);
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> rawDataList = responseData['attendances'];
      List<AttendanceModel> attendanceList = rawDataList.map((data) => AttendanceModel.fromJson(data)).toList();

      return attendanceList;
    } else {
      throw Exception('Failed to load attendance data');
    }
  }
}
