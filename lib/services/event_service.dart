import 'dart:convert';

import 'package:dio/dio.dart';

import '../interfaces/event_interface.dart';
import '../models/events_model.dart';

class CollegeEvents extends Events {
  @override
  Future<List<EventsModel>> eventsFeed() async {
    // for android use 10.0.2.2/8000
    // for iOS use 127.0.0.1/8000
    // aws baserl -> https://z8w307611i.execute-api.ap-south-1.amazonaws.com/
    const url =
        "https://z8w307611i.execute-api.ap-south-1.amazonaws.com/faculty/api/getevents/";

    final dio = Dio();

    //The data being retrieved is List of json data
    try {
      Response response = await dio.get(url);

      List<EventsModel> dataList =
          (response.data as List).map((x) => EventsModel.fromJson(x)).toList();

      return dataList;
      // }
    } catch (e) {
      // If the server return 400 ,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }
}
