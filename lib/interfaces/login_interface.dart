import 'package:dio/dio.dart';
import 'package:facultyapp/models/faculty_login_model.dart';
import 'package:flutter/material.dart';
import 'package:facultyapp/models/faculty_login_model.dart';

abstract class Login {
  Future<FacultyLoginModel> FacultyLogin(
    String email,
    String password,
  ) async {
    const url =
        "https://z8w307611i.execute-api.ap-south-1.amazonaws.com/faculty/api/user/login/";
    final data = {
      "email": email,
      "password": password,
    };
    try {
      // for android use 10.0.2.2/8000
      // for iOS use 127.0.0.1/8000

      final dio = Dio();

      Response response = await dio.post(url, data: data);
      final body = response.data;
      return FacultyLoginModel(email: email, token: body['token']['access']);
    } catch (e) {
      print("Login Error $e");
      return FacultyLoginModel();
    }
  }
}
