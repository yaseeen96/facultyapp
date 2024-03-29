import 'package:flutter/material.dart';
import 'package:facultyapp/interfaces/register_interface.dart';

import '../../utils/configurations.dart';
import '../signup/signup_page.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../services/register_service.dart';

class SignupPagetwo extends StatelessWidget {
  SignupPagetwo({super.key, required this.name, required this.department});

  final formkey = GlobalKey<FormState>();
  final TextEditingController name;
  final TextEditingController department;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final Register _register = UserRegister();
  @override
  Widget build(BuildContext context) {
    final deviceWidth = getDeviceWidth(context);
    final deviceHeight = getDeviceHeight(context);
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(
                height: deviceHeight * 0.08,
              ),
              const Text(
                "One last step",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              CustomTextFormField(
                controller: email,
                controllerName: "Email",
                formValidator: (value) {
                  if (value!.isEmpty) {
                    return "Enter the field";
                  }
                },
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              CustomTextFormField(
                isPassword: true,
                controller: password,
                controllerName: "Password",
                formValidator: (value) {
                  if (value!.isEmpty) {
                    return "Enter the field";
                  }
                },
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              CustomTextFormField(
                isPassword: true,
                controller: confirmPassword,
                controllerName: "Confirm Password",
                formValidator: (value) {
                  if (value!.isEmpty) {
                    return "Enter the field";
                  }
                },
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.075),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(
                        "Back",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          if (confirmPassword.text != "") {
                            _register.FacultyRegister(
                                email.text,
                                name.text,
                                department.text,
                                password.text,
                                confirmPassword.text);
                            Navigator.popAndPushNamed(context, '/login');
                          }
                        }
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
