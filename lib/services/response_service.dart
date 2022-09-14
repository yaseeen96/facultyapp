import 'package:dio/dio.dart';

import 'package:facultyapp/models/response_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/response_interface.dart';

class StudentResponseList extends ResponseList {
  @override
  Future<List<ResponseModel>> getStudentResponse(int eventId) async {
    String url =
        'https://z8w307611i.execute-api.ap-south-1.amazonaws.com/faculty/api/students/?event_id=$eventId';
    final dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    dio.options.headers["Authorization"] = "Bearer $token";
    try {
      Response response = await dio.get(url);

      List<ResponseModel> dataList = (response.data as List)
          .map((x) => ResponseModel.fromJson(x))
          .toList();

      return dataList;
    } catch (e) {
      throw Exception("Error from response Interface:$e");
    }
  }
}
