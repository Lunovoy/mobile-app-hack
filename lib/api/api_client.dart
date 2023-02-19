import 'dart:io';

import 'package:http/http.dart' as http;

class ApiClient {
  Future<dynamic> getDorms() async {
    http.Response response =
        await http.get(Uri(path: "http://212.193.60.252:8000/dormitories/all"));
    print(response.body);
    return response;
  }
}
