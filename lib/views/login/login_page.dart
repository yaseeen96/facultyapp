//pre-defined
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:facultyapp/views/signup/signup_page.dart';
import 'package:facultyapp/widgets/custombutton.dart';

//user-defined

import '../user/user_page.dart';
import '../../utils/configurations.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/cse_logo.dart';
import '../../models/faculty_login_model.dart';
import '../../services/login_service.dart';
import '../../interfaces/login_interface.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  var isPassword = false;
  final Login _login = UserLogin();
  @override
  Widget build(BuildContext context) {
    final deviceWidth = getDeviceWidth(context);
    final deviceHeight = getDeviceHeight(context);
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).highlightColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: deviceHeight * 0.08,
              ),
              Container(
                // margin: EdgeInsets.only(top: deviceHeight * 0.15),
                alignment: Alignment.center,
                padding: EdgeInsets.all(50),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 4)),
                child: Text(
                  "CSE",
                  style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              CustomTextFormField(
                controller: email,
                controllerName: "Email",
              ),
              SizedBox(
                height: deviceHeight * 0.03,
              ),
              CustomTextFormField(
                isPassword: true,
                controller: password,
                controllerName: "Password",
              ),
              Align(
                alignment: Alignment.centerLeft,
                widthFactor: 2.1,
                child: TextButton(
                  onPressed: () {
                    null;
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.02,
              ),
              SizedBox(
                width: deviceWidth * 0.8,
                height: deviceHeight * 0.07,
                child: ElevatedButton(
                  onPressed: () async {
                    //api request part
                    FacultyLoginModel? user =
                        await _login.FacultyLogin(email.text, password.text);

                    //user session management part
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString("token", user.token!);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserPage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF141877)),
                  ),
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "New User?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupPage(),
                  ),
                ),
                child: Text(
                  "Create Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
