import 'dart:convert';

import 'package:florataba_mobile_app/api/credentials.dart';
import 'package:florataba_mobile_app/api/user/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future createUser(Map<String, String> data) {
    return http.post(
      Uri.parse('http://$API_SERVER_IP:8000/users/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': data["email"] as String,
        'first_name': data["first_name"] as String,
        'surname': data["surname"] as String,
        'phone_number': data["phone_number"] as String,
        '_User__password': data["password"] as String,
      }),
    );
  }

  Future<UserModel?> getUser(String id) async {
    try {
      var response =
          await http.get(Uri.parse('http://$API_SERVER_IP:8000/users/$id'));
      final dataCollection = jsonDecode(response.body);
      return UserModel.fromJson(dataCollection);
    } catch (error) {
      return null;
    }
  }

  Future<int> validateUser() async {
    const storage = FlutterSecureStorage();
    if (await storage.read(key: "isLogged") == "true") {
      String? storedEmail = await storage.read(key: "email");
      try {
        var response = await http
            .get(Uri.parse('http://$API_SERVER_IP:8000/users/$storedEmail'));
        return response.statusCode;
      } catch (error) {
        return 404;
      }
    } else {
      return 404;
    }
  }
}
