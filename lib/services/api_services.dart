import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task/models/api_model.dart';

class ApiServices {
  static Future<ApiDataModel> getApiCall({required String url}) async {
    final Uri uri = Uri.parse(url);
    try {
      final http.Response response = await http.get(
        uri,
      );
      if (response.statusCode == 200) {
        return ApiDataModel.fromJson(json.decode(response.body));
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      rethrow;
    }
  }
}
