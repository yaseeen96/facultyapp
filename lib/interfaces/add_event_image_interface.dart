import 'dart:io';

import 'package:dio/dio.dart';
import 'package:facultyapp/models/response_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/events_model.dart';

abstract class AddEventImage {
  Future addEventImages(
    File? image,
    EventsModel eventData,
  ) async {
    try {
      // for android use 10.0.2.2/8000
      // for iOS use 127.0.0.1/8000
      const url =
          "https://z8w307611i.execute-api.ap-south-1.amazonaws.com/faculty/api/addeventimages/";

      String filename = image!.path.split("/").last;
      FormData formData = FormData.fromMap({
        "eventImage": await MultipartFile.fromFile(image.path,
            filename: filename, contentType: MediaType("jpeg", "png")),
        "event": eventData.id,
      });

      final dio = Dio();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      dio.options.headers["Authorization"] = "Bearer $token";

      await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            "Content-Type": "multi-form/form-data",
          },
        ),
      );

      // );
    } catch (e) {
      print("Request Error -> ${e}");
    }
  }
}
