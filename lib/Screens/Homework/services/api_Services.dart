import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../models/Assignment_model.dart';

class AssignmentRepository {
  Future<List<Assignment>> fetchAssignments() async {
    final response = await http.get(Uri.parse('https://school-management-system-backend-eight.vercel.app/assignment'));
    print(response.body);
    if (response.statusCode == 200) {
      final dynamic jsonResponse = json.decode(response.body);

      if (jsonResponse is List) {
        List<Assignment> assignmentList = jsonResponse.map((jsonData) {
          try {
            return Assignment.fromJson(jsonData as Map<String, dynamic>);
          } catch (e) {
            print('Error parsing JSON data: $e');
            throw Exception('Failed to parse JSON data');
          }
        }).toList();

        print(assignmentList);
        return assignmentList; // Move the return statement here
      } else {
        print('Invalid JSON response: $jsonResponse');
        throw Exception('Invalid JSON response: $jsonResponse');
      }
    } else {
      print('Failed to load assignments: ${response.statusCode}');
      throw Exception('Failed to load assignments: ${response.statusCode}');
    }
  }
}
