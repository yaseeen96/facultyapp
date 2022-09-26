import 'package:dio/dio.dart';
import 'package:facultyapp/models/faculty_login_model.dart';
import 'package:flutter/material.dart';
import 'package:facultyapp/models/faculty_login_model.dart';
import 'package:ftoast/ftoast.dart';

import '../interfaces/login_interface.dart';

class UserLogin extends Login {
  var _message = "";

  @override
  Future<FacultyLoginModel> FacultyLogin(
    String? email,
    String? password,
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
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.cancel:
          _message = "Request cancelled";
          break;
        case DioErrorType.connectTimeout:
          _message = "Connection timed uut";
          break;
        case DioErrorType.sendTimeout:
          _message = "Connection failed, try again later";
          break;
        case DioErrorType.receiveTimeout:
          _message = "Connection failed, try again later";
          break;
        case DioErrorType.response:
          if (e.response!.statusCode == 400) _message = "Bad request";
          if (e.response!.statusCode == 401 || e.response!.statusCode == 403)
            _message = "Inavlid Credentials";
          if (e.response!.statusCode == 404) _message = "Account not found";
          if (e.response!.statusCode == 500) _message = "Account already exist";
          if (e.response!.statusCode == 400) _message = "Improper values";
          break;
        case DioErrorType.other:
          _message = "No Internt connection";
          break;
        default:
          _message = "Oops!!, something went wrong";
      }
      print("Login Error $_message");
      var errorMessage = FacultyLoginModel();
      errorMessage.errorMessage = _message;
      return errorMessage;
    }
  }
}
