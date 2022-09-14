import 'package:dio/dio.dart';
import '../models/event_image_model.dart';

abstract class ImageList {
  Future<List<EventsImageModel>> getEventsImage() async {
    // for localhost android use 10.0.2.2/8000
    // for localhost iOS use 127.0.0.1/8000
    // aws baserl -> https://z8w307611i.execute-api.ap-south-1.amazonaws.com/
    const url =
        "https://z8w307611i.execute-api.ap-south-1.amazonaws.com/faculty/api/geteventimages/";

    final dio = Dio();

    try {
      Response response = await dio.get(url);

      //The data being retrieved is List of json data
      List<EventsImageModel> dataList = (response.data as List)
          .map((x) => EventsImageModel.fromJson(x))
          .toList();

      return dataList;
    } catch (e) {
      throw Exception('Failed to load');
    }
  }
}
