import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/fee.dart';
import '../Attendance/classSingleton.dart';

class FeesService {

  static Future<List<Fee>> getFees() async {
    print("hello from fees service");
    final response = await http.get(Uri.parse('https://school-management-system-backend-eight.vercel.app/fee'));
    print(response.body);
    if (response.statusCode == 200) {
      print(response.statusCode);
      final dynamic jsonResponse = json.decode(response.body);
      if (jsonResponse is List) {
        List<Fee> FeeList = jsonResponse.map((jsonData) {
          try {
            return Fee.fromJson(jsonData as Map<String, dynamic>);
          } catch (e) {
            print('Error parsing JSON data: $e');
            throw Exception('Failed to parse JSON data');
          }
        }).toList();

        print(FeeList);
        return FeeList; // Move the return statement here
      } else {
        print('Invalid JSON response: $jsonResponse');
        throw Exception('Invalid JSON response: $jsonResponse');
      }


    } else {
      throw Exception('Failed to load assignments: ${response.statusCode}');
    }
  }
}
