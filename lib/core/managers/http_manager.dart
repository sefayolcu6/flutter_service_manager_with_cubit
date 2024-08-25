import 'dart:convert';

import 'package:flutter_service_manager/core/managers/status_code_enum.dart';
import 'package:http/http.dart' as http;

class HttpManager {
  Future<T> getFromApi<T>(
      {required String apiUrl,
      required T Function(Map<String, dynamic>) fromJson}) async {
    final url = Uri.parse(apiUrl);
    final response = await http.get(url);

    if (response.statusCode == StatusCodeEnum.success.statusCode) {
      return fromJson(jsonDecode(response.body));
    } else {
      throw Exception('API çağrısı başarısız oldu: ${response.statusCode}');
    }
  }
 
  Future<List<T>> getListFromApi<T>(
      {required String apiUrl,
      required T Function(Map<String, dynamic>) fromJson}) async {
    final url = Uri.parse(apiUrl);
    final response = await http.get(url);

    if (response.statusCode == StatusCodeEnum.success.statusCode) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList
          .map((jsonItem) => fromJson(jsonItem as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('API çağrısı başarısız oldu: ${response.statusCode}');
    }
  }
}
