import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:facultyapp/models/faculty_login_model.dart';

abstract class Register {
  void FacultyRegister(String email, String name, String department,
      String password, String password2) async {
    try {
      // for android use 10.0.2.2/8000
      // for iOS use 127.0.0.1/8000
      final url =
          "https://z8w307611i.execute-api.ap-south-1.amazonaws.com/faculty/api/user/register/";
      final data = {
        "email": email,
        "name": name,
        "department": department,
        "password": password,
        "password2": password2,
      };

      final dio = Dio();

      Response response = await dio.post(url, data: data);
    } catch (e) {
      print("Request Error -> ${e}");
    }
  }
}
