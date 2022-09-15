import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:facultyapp/interfaces/profile_interface.dart';
import 'package:facultyapp/models/faculty_profile_model.dart';

class StudentProfile extends Profile {
  @override
  Future<FacultyProfileModel> UserProfile() async {
    // for android use 10.0.2.2/8000
    // for iOS use 127.0.0.1/8000
    const url =
        "https://z8w307611i.execute-api.ap-south-1.amazonaws.com/faculty/api/user/profile/";

    final dio = Dio();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio.get(url);
    // If the server did return a 200 OK response,
    // then parse the JSON.
    if (response.statusCode == 200) {
      FacultyProfileModel data = FacultyProfileModel.fromJson(response.data);
      // print(data.department);
      return data;
    } else {
      // If the server return 400 ,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }
}
