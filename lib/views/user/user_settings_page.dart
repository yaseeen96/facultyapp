import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:facultyapp/utils/configurations.dart';
import 'package:facultyapp/views/login/login_page.dart';
import 'package:facultyapp/widgets/read_only_text_field.dart';
import 'package:wiredash/wiredash.dart';

class UserSettingsPage extends StatefulWidget {
  UserSettingsPage({super.key});

  @override
  State<UserSettingsPage> createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(
          "Preferences",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).highlightColor,
        // leading: InkWell(
        //   onTap: () => Navigator.pop(context, true),
        //   child: Icon(
        //     Icons.arrow_back_ios,
        //     color: Theme.of(context).primaryColor,
        //   ),
        // ),
        actions: [
          IconButton(
              padding: EdgeInsets.symmetric(
                  horizontal: getDeviceWidth(context) * 0.1),
              iconSize: 35,
              onPressed: () => Navigator.pop(context, true),
              icon: Icon(
                Icons.home,
                color: Theme.of(context).primaryColor,
              ))
        ],
      ),
      body: SlidingUpPanel(
        parallaxEnabled: true,
        parallaxOffset: 0.12,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        maxHeight: getDeviceHeight(context),
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

              Container(
                width: getDeviceWidth(context),
                height: getDeviceHeight(context) * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: getDeviceWidth(context) * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: null,
                      color: Theme.of(context).primaryColor,
                      icon: Icon(Icons.keyboard_arrow_right),
                      iconSize: 40,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.02,
              ),
              Container(
                width: getDeviceWidth(context),
                height: getDeviceHeight(context) * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: getDeviceWidth(context) * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: null,
                      color: Theme.of(context).primaryColor,
                      icon: Icon(Icons.keyboard_arrow_right),
                      iconSize: 40,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: getDeviceHeight(context) * 0.02,
              ),
              Container(
                width: getDeviceWidth(context),
                height: getDeviceHeight(context) * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: getDeviceWidth(context) * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.feedback_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                          SizedBox(
                            width: getDeviceWidth(context) * 0.04,
                          ),
                          Text(
                            "Send Feedback",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Wiredash.of(context).show();
                      },
                      color: Theme.of(context).primaryColor,
                      icon: Icon(Icons.keyboard_arrow_right),
                      iconSize: 40,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: getDeviceHeight(context) * 0.02,
              ),
              Container(
                width: getDeviceWidth(context),
                height: getDeviceHeight(context) * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: getDeviceWidth(context) * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
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
                      color: Theme.of(context).primaryColor,
                      icon: Icon(Icons.keyboard_arrow_right),
                      iconSize: 40,
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
