
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../models/routine_model.dart';

class RoutineRepository {
  Future<List<Routine>> getRoutine() async {
    final response = await http.get(Uri.parse('http://192.168.56.1:7000/routine'));
    print(response.body);
    if (response.statusCode == 200) {
      print("hello from 200");
      final List<dynamic> data = json.decode(response.body);
      print('Retrieved data: $data');
      // print(data);
      List<Routine> routineList = data.map((jsonData) => Routine.fromJson(jsonData)).toList();
      print('Retrieved routines: $routineList');
      print(routineList);
      return routineList;



    } else {
      throw Exception('Failed to load routines');
    }
  }
}
