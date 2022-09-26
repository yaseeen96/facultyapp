import 'dart:io';

import 'package:dio/dio.dart';
import 'package:facultyapp/services/add_event_service.dart';
import 'package:facultyapp/utils/configurations.dart';
import 'package:facultyapp/widgets/custom_text_form_field.dart';
import 'package:facultyapp/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../interfaces/add_event_interface.dart';

// make statefull widget Plural to avoid conflict with below abstract cladd
final AddEvent _addEvent = AddCollegeEvent();

class AddEvents extends StatefulWidget {
  const AddEvents({super.key});

  @override
  State<AddEvents> createState() => _AddEventsState();
}

String? dropValue = null;

List<String> eventTypeItems = ["Online", "Offline"];
// String imageString = "";
File imageUpload = File("");

TextEditingController eventTitle = TextEditingController();
TextEditingController resourcePersonName = TextEditingController();
TextEditingController aboutResourcePerson = TextEditingController();
TextEditingController aboutEvent = TextEditingController();
TextEditingController socialLink = TextEditingController();
TextEditingController venue = TextEditingController();
TextEditingController startDate = TextEditingController();
TextEditingController endDate = TextEditingController();

class _AddEventsState extends State<AddEvents> {
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    Image? imageDisplay;
    if (image!.path == null) return;

    File imageFile = File(image.path);

    setState(() {
      imageUpload = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          color: Theme.of(context).primaryColor,
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context, true),
        ),
        backgroundColor: Theme.of(context).highlightColor,
        title: Text(
          "Add Event",
          style: TextStyle(
              fontSize: 24.sp,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        children: [
          // Event title
          CustomTextFormField(
              controller: eventTitle, controllerName: "Event Title"),
          SizedBox(
            height: getDeviceHeight(context) * 0.02,
          ),
          // Event type
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black87),
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(border: InputBorder.none),
              elevation: 0,
              dropdownColor: Theme.of(context).highlightColor,
              // underline: Container(),
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                // textDirection: TextDirection,
              ),
              value: dropValue,
              hint: Text(
                'Event Type',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // style: customTextStyle(
              //     fontSize: SizeConfig.screenWidth! * 0.04,
              //     color: kcSecondaryColor),
              iconSize: 30.0,
              iconEnabledColor: Theme.of(context).primaryColor,
              items:
                  eventTypeItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  dropValue = value!;
                });
              },
              // Required
              validator: (value) =>
                  value == null ? 'Please select user type' : null,
            ),
          ),
          SizedBox(
            height: getDeviceHeight(context) * 0.02,
          ),
          CustomTextFormField(
            controller: aboutEvent,
            controllerName: "Brief Description about event",
            maximumLines: 8,
          ),
          SizedBox(
            height: getDeviceHeight(context) * 0.02,
          ),
          // name of resource person
          CustomTextFormField(
              controller: resourcePersonName,
              controllerName: "Name of Resource Person"),
          SizedBox(
            height: getDeviceHeight(context) * 0.02,
          ),
          // about resource person
          CustomTextFormField(
            controller: aboutResourcePerson,
            controllerName: "About Resource Person",
            maximumLines: 6,
          ),
          SizedBox(
            height: getDeviceHeight(context) * 0.02,
          ),
          // social media handles of resource person
          CustomTextFormField(
              controller: socialLink,
              controllerName: "Social media link of Resource person"),
          SizedBox(
            height: getDeviceHeight(context) * 0.02,
          ),
          CustomTextFormField(
              controller: venue, controllerName: "Venue of Event"),
          SizedBox(
            height: getDeviceHeight(context) * 0.02,
          ),
          // start date
          TextField(
            controller: startDate,
            style: TextStyle(fontWeight: FontWeight.bold),

            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                icon: Icon(Icons.calendar_today), //icon of text field
                labelText: "Start Date" //label text of field

                ),
            readOnly: true,
            //set it true, so that user will not able to edit text
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2022),
                  //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2100));

              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package =>  2021-03-16
                setState(() {
                  startDate.text = formattedDate;
                  // Date1 = DateTime.parse(formattedDate);

                  //set output date to TextField value.
                });
              } else {}
            },
          ),
          SizedBox(
            height: getDeviceHeight(context) * 0.02,
          ),
          TextField(
            controller: endDate,
            style: TextStyle(fontWeight: FontWeight.bold),

            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                icon: Icon(Icons.calendar_today), //icon of text field
                labelText: "End Date" //label text of field

                ),
            readOnly: true,
            //set it true, so that user will not able to edit text
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2022),
                  //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2100));

              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package =>  2021-03-16
                setState(() {
                  endDate.text = formattedDate;

                  // Date2 = DateTime.parse(
                  //     formattedDate); //set output date to TextField value.
                });
              } else {}
            },
          ),
          SizedBox(
            height: getDeviceHeight(context) * 0.02,
          ),
          // add image
          Row(
            children: [
              // Container(
              //   width: getDeviceWidth(context) * 0.5,
              //   height: getDeviceHeight(context) * 0.2,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     border: Border.all(color: Colors.black),
              //     // color: Colors.amber,
              //     // image: DecorationImage(
              //     //   image: FileImage(imageUpload),
              //     // ),
              //   ),
              //   child: Column(
              //     children: [
              //       Text("Image Preview"),
              //       SizedBox(
              //         height: getDeviceHeight(context) * 0.02,
              //       ),
              //       Image.file(
              //         imageUpload,
              //         width: 150,
              //         height: 100,
              //       )
              //     ],
              //   ),
              // ),
              SizedBox(
                width: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  getImage();
                },
                child: Text("Add Image"),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(
            height: getDeviceHeight(context) * 0.02,
          ),
          customButton(
              deviceHeight: getDeviceHeight(context),
              deviceWidth: getDeviceWidth(context),
              text: "Add Event",
              onTap: () async {
                await _addEvent.addEventDetails(
                    eventTitle.text,
                    dropValue!,
                    resourcePersonName.text,
                    aboutResourcePerson.text,
                    aboutEvent.text,
                    venue.text,
                    socialLink.text,
                    startDate.text,
                    endDate.text,
                    imageUpload);

                Navigator.pop(context, true);
              })
        ],
      ),
    );
  }
}
