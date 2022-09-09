import 'package:dio/dio.dart';
import 'package:facultyapp/interfaces/register_interface.dart';

class UserRegister extends Register {
  @override
  void StudentRegister(String email, String name, String department,
      String password, String password2) async {
    try {
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
