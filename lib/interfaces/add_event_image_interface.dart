import 'dart:io';

import 'package:dio/dio.dart';
import 'package:facultyapp/models/response_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/events_model.dart';

abstract class AddEventImage {
  Future addEventImages(
    List<String>? filepath,
    EventsModel eventData,
  ) async {
    try {
      // for android use 10.0.2.2/8000
      // for iOS use 127.0.0.1/8000
      const url =
          "https://z8w307611i.execute-api.ap-south-1.amazonaws.com/faculty/api/addeventimages/";

      FormData formData = FormData();
      for (var file in filepath!) {
        formData.files.addAll(
          [
            MapEntry(
              "${eventData.id}",
              await MultipartFile.fromFile(file),
            ),
          ],
        );
      }

      final dio = Dio();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      dio.options.headers["Authorization"] = "Bearer $token";

      for (var i = 0; i < filepath.length; i++) {
        await dio.post(url, data: formData);
      }
      // Response response = await dio.post(
      //   url,
      //   data: formData,
      // );
    } catch (e) {
      print("Request Error -> ${e}");
    }
  }
}
