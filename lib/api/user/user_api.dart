import 'dart:convert';

import 'package:florataba_mobile_app/api/credentials.dart';
import 'package:florataba_mobile_app/api/user/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future createUser(Map<String, String> data) async {
    http.Response resp = await http.post(
      Uri.parse('http://$API_SERVER_IP:8000/api/user/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': data["email"] as String,
        'first_name': data["first_name"] as String,
        'surname': data["surname"] as String,
        'phone_number': data["phone_number"] as String,
        'password': data["password"] as String,
      }),
    );
    print(resp.body);
    return resp;
  }

  Future<UserModel?> getUser(String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse('http://$API_SERVER_IP:8000/api/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      final dataCollection = jsonDecode(response.body);
      print(dataCollection);
      print(UserModel.fromJson(dataCollection).email);

      return UserModel.fromJson(dataCollection);
    } catch (error) {
      return null;
    }
  }

  Future<int> validateUser() async {
    const storage = FlutterSecureStorage();
    if (await storage.read(key: "isLogged") == "true") {
      String? storedEmail = await storage.read(key: "email");
      String? storedPassword = await storage.read(key: "password");

      try {
        var response = await http.post(
          Uri.parse('http://$API_SERVER_IP:8000/api/auth/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email': storedEmail as String,
            'password': storedPassword as String,
          }),
        );
        return response.statusCode;
      } catch (error) {
        return 404;
      }
    } else {
      return 404;
    }
  }
}
