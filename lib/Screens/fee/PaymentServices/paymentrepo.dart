import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schoolmanagementsystem/Screens/fee/PaymentServices/useridsingleton.dart';
import '../../../models/Assignment_model.dart';
import '../../../models/PaymentModel.dart';

class PaymentRepository {
  Future<List<PaymentModel>> fetchPayments() async {
    print("hello from payment");
    final response = await http.get(Uri.parse('http://192.168.56.1:7000/Payments'));
    print(response.body);
    if (response.statusCode == 200) {
      print(response.statusCode);
      final dynamic jsonResponse = json.decode(response.body);

      if (jsonResponse is List) {
        print("List");
        List<PaymentModel> PaymentList = jsonResponse.map((jsonData) {
          try {
            return PaymentModel.fromJson(jsonData as Map<String, dynamic>);
          } catch (e) {
            print('Error parsing JSON data: $e');
            throw Exception('Failed to parse JSON data');
          }
        }).toList();

        print(PaymentList);
        return PaymentList; // Move the return statement here
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
