import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:facultyapp/interfaces/profile_interface.dart';
import 'package:facultyapp/models/faculty_profile_model.dart';
import 'package:facultyapp/services/profile_service.dart';

import 'package:facultyapp/utils/configurations.dart';
import 'package:facultyapp/views/login/login_page.dart';
import 'package:facultyapp/widgets/read_only_text_field.dart';
import 'package:wiredash/wiredash.dart';

import '../../utils/configurations.dart';
import '../../widgets/read_only_text_field.dart';

class UserSettingsPage extends StatefulWidget {
  const UserSettingsPage({super.key});

  @override
  State<UserSettingsPage> createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  FacultyProfileModel? profileData;
  Future<FacultyProfileModel>? _userData;
  final Profile _profile = StudentProfile();

  // void getprofile() async {
  //   _userData = await _profile.UserProfile();
  // }

  @override
  void initState() {
    // getprofile();
    _userData = _profile.UserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      body: SlidingUpPanel(
        parallaxEnabled: true,
        parallaxOffset: 0.12,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        maxHeight: getDeviceHeight(context),
        minHeight: getDeviceHeight(context) * 0.30,
        color: Theme.of(context).primaryColor,
        panelBuilder: (controller) {
          return FutureBuilder<FacultyProfileModel>(
              future: _userData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data != null) {
                  profileData = snapshot.data!;

                  return ProfileWidget(
                      profileData: profileData, controller: controller);
                } else {
                  return Center(child: Text("Error : ${snapshot.error}"));
                }
              });
        },
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getDeviceWidth(context) * 0.04),
              child: AppBar(
                leading: IconButton(
                  color: Theme.of(context).primaryColor,
                  icon: Icon(Icons.arrow_back_rounded),
                  onPressed: () => Navigator.pop(context, true),
                ),
                centerTitle: true,
                // automaticallyImplyLeading: true,
                title: Text(
                  "Preferences",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp),
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
                //
              ),
            ),
            Container(
              padding: EdgeInsets.all(getDeviceWidth(context) * 0.08),
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
                          width: getDeviceWidth(context) * 0.5,
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
                          width: getDeviceWidth(context) * 0.5,
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
                          width: getDeviceWidth(context) * 0.5,
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
                          width: getDeviceWidth(context) * 0.5,
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
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text(
                                      "No",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();

                                      prefs.remove("token");
                                      Navigator.popAndPushNamed(
                                          context, "/login");
                                    },
                                    child: Text(
                                      "Yes",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Theme.of(context).primaryColor),
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
          ],
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    required this.profileData,
    required this.controller,
  }) : super(key: key);

  final FacultyProfileModel? profileData;
  final controller;
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      controller: controller,
      children: [
        Center(
          // Bar
          child: Container(
            margin: EdgeInsets.all(8),
            width: 100,
            height: 7,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
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
            // height: getDeviceHeight(context) * 0.03,
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
          padding:
              EdgeInsets.symmetric(horizontal: getDeviceWidth(context) * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Email",
                  style: TextStyle(
                      color: Theme.of(context).highlightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              readOnlyTextField(
                "${profileData!.email}",
                Theme.of(context).highlightColor,
              ),
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
                "${profileData!.name}",
                Theme.of(context).highlightColor,
              ),
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
              readOnlyTextField("${profileData!.department}",
                  Theme.of(context).highlightColor),
            ],
          ),
        ))
      ],
    );
  }
}
