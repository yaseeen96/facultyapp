//pre-defined imports
import 'package:flutter/material.dart';
import 'package:facultyapp/interfaces/register_interface.dart';
import 'package:facultyapp/services/register_service.dart';
import 'package:facultyapp/views/signup/signup_page_two.dart';
import 'package:ftoast/ftoast.dart';

//user-defined imports
import '../../views/login/login_page.dart';
import '../../utils/configurations.dart';
import '../../widgets/custom_text_form_field.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController department = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final Register _register = UserRegister();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final deviceWidth = getDeviceWidth(context);
    final deviceHeight = getDeviceHeight(context);
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: deviceHeight * 0.08,
                ),
                Center(
                  child: Text(
                    "Fill the below details",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.05,
                ),
                CustomTextFormField(
                  controller: name,
                  controllerName: "Name",
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
                  controller: department,
                  controllerName: "Department",
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
                  padding:
                      EdgeInsets.symmetric(horizontal: deviceWidth * 0.075),
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
                          // FToast.toast(context, msg: department.value.text);
                          if (formKey.currentState!.validate()) {
                            if (department.text != "") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupPagetwo(
                                    name: name,
                                    department: department,
                                  ),
                                ),
                              );
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
