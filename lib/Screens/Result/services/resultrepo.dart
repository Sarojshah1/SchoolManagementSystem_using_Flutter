import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../models/resultModel.dart';


class ResultRepository {
  Future<List<ResultModel>> fetchResults() async {
    try {
      final response = await http.get(Uri.parse('https://school-management-system-backend-eight.vercel.app/results'));
      print(response.body);
      if (response.statusCode == 200) {
        print(response.statusCode);
        Iterable jsonResponse = json.decode(response.body);
        print(jsonResponse);
        return jsonResponse.map((result) => ResultModel.fromJson(result)).toList();
      } else {
        throw Exception('Failed to load results');
      }
    } catch (e) {
      throw Exception('Failed to load results: $e');
    }
  }
}
