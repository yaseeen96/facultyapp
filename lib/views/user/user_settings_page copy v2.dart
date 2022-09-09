import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:facultyapp/utils/configurations.dart';
import 'package:facultyapp/views/login/login_page.dart';
import 'package:facultyapp/widgets/read_only_text_field.dart';

class UserSettingsPage extends StatefulWidget {
  UserSettingsPage({super.key});

  @override
  State<UserSettingsPage> createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  var isSwitched = false;
  var darkMode = false;

  void toggleSwitch(bool value) {
    if (isSwitched == true) {
      setState(() {
        isSwitched = false;
        darkMode = false;
      });
    } else {
      setState(() {
        isSwitched = true;
        darkMode = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: AppBar(
        title: Text(
          "Account",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context, true),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [],
      ),
      body: SlidingUpPanel(
        parallaxEnabled: true,
        parallaxOffset: 0.12,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        maxHeight: getDeviceHeight(context) * 0.85,
        minHeight: getDeviceHeight(context) * 0.29,
        color: Theme.of(context).primaryColor,
        panelBuilder: (controller) {
          return ListView(
            scrollDirection: Axis.vertical,
            controller: controller,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(8),
                  width: 100,
                  height: 7,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Text(
                "View Profile",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).highlightColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.03,
              ),
              Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.account_circle,
                  size: getDeviceHeight(context) * 0.15,
                  color: Theme.of(context).highlightColor,
                ),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.05,
              ),
              Center(
                  child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getDeviceWidth(context) * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Email ID",
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    readOnlyTextField(
                        "Email Id", Theme.of(context).highlightColor),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Full Name",
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    readOnlyTextField(
                        "Full Name", Theme.of(context).highlightColor),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "USN Number",
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    readOnlyTextField("USN", Theme.of(context).highlightColor),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Department",
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    readOnlyTextField(
                        "Department", Theme.of(context).highlightColor),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Semester",
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    readOnlyTextField(
                        "Semester", Theme.of(context).highlightColor),
                  ],
                ),
              ))
            ],
          );
        },
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              SizedBox(
                height: getDeviceHeight(context) * 0.03,
              ),

              // SizedBox(
              //   height: getDeviceHeight(context) * 0.08,
              // ),
              Row(
                children: [
                  Icon(
                    Icons.dark_mode_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: getDeviceWidth(context) * 0.04,
                  ),
                  Text(
                    "Dark Mode",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: getDeviceWidth(context) * 0.35,
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: toggleSwitch,
                    activeColor: Theme.of(context).highlightColor,
                    inactiveThumbColor: Theme.of(context).primaryColor,
                    inactiveTrackColor: Colors.black26,
                    activeTrackColor: Colors.black26,
                  )
                ],
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.05,
              ),
              Row(
                children: [
                  Icon(
                    Icons.notifications,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: getDeviceWidth(context) * 0.04,
                  ),
                  Text(
                    "Notification",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: getDeviceWidth(context) * 0.34,
                  ),
                  InkWell(
                    onTap: null,
                    // onTap: () => Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => UserNotificationPage(),
                    //   ),
                    // ),
                    child: Icon(
                      color: Colors.black26,
                      Icons.keyboard_arrow_right,
                      size: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.05,
              ),

              Row(
                children: [
                  Icon(
                    Icons.info_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: getDeviceWidth(context) * 0.04,
                  ),
                  Text(
                    "About",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: getDeviceWidth(context) * 0.46,
                  ),
                  InkWell(
                    onTap: null,
                    // onTap: () => Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => AboutPage(),
                    //   ),
                    // ),
                    child: Icon(
                      color: Colors.black26,
                      Icons.keyboard_arrow_right,
                      size: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.05,
              ),
              Row(
                children: [
                  Icon(
                    Icons.lock_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: getDeviceWidth(context) * 0.04,
                  ),
                  Text(
                    "Logout",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: getDeviceWidth(context) * 0.44,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Logout"),
                          content: Text(
                            "Are you sure?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                "No",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                "",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                "",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.remove("token");
                                Navigator.popAndPushNamed(context, "/login");
                              },
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    child: Icon(
                      color: Colors.black26,
                      Icons.keyboard_arrow_right,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
