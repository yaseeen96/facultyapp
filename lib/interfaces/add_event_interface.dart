import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import 'package:shared_preferences/shared_preferences.dart';

abstract class AddEvent {
  Future addEventDetails(
      String eventTitle,
      String eventType,
      String resourceName,
      String aboutResource,
      String aboutEvent,
      String venue,
      String social,
      String startDate,
      String endDate,
      File image) async {
    try {
      // for android use 10.0.2.2/8000
      // for iOS use 127.0.0.1/8000
      const url =
          "https://z8w307611i.execute-api.ap-south-1.amazonaws.com/faculty/api/addevents/";

      // final data = FormData.fromMap({
      //   "eventTitle": eventTitle,
      //   "eventType": eventType,
      //   "resoourceName": resourceName,
      //   "aboutResource": aboutResource,
      //   "aboutEvent": aboutEvent,
      //   "venue": venue,
      //   "social": social,
      //   "startDate": startDate,
      //   "endDate": endDate,
      //   'image': image,
      // });
      String filename = image.path.split("/").last;
      FormData formData = FormData.fromMap({
        "eventTitle": eventTitle,
        "eventType": eventType,
        "resourceName": resourceName,
        "aboutEvent": aboutEvent,
        "venue": venue,
        "social": Uri.parse("http://${social}"),
        "aboutResource": aboutResource,
        "startDate": startDate,
        "endDate": endDate,
        "image": await MultipartFile.fromFile(image.path,
            filename: filename, contentType: MediaType("jpeg", "png")),
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
    } catch (e) {
      print("Request Error -> ${e}");
    }
  }
}
