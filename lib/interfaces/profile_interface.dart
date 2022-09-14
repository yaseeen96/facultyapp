import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:facultyapp/models/faculty_profile_model.dart';

abstract class Profile {
  Future<FacultyProfileModel> UserProfile() async {
    // for android use 10.0.2.2/8000
    // for iOS use 127.0.0.1/8000
    final url =
        "https://c08gjwvlm3.execute-api.ap-south-1.amazonaws.com/student/studentapi/student/profile/";

    final dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    dio.options.headers["Authorization"] = "Bearer $token";

    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      FacultyProfileModel data = FacultyProfileModel.fromJson(response.data);

      return data;
    } else {
      // If the server return 400 ,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }
}
