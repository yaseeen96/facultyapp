import 'package:facultyapp/interfaces/response_interface.dart';
import 'package:facultyapp/models/response_model.dart';
import 'package:facultyapp/services/response_service.dart';
import 'package:facultyapp/utils/configurations.dart';
import 'package:facultyapp/views/events/convert_excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/read_only_text_field.dart';

class EventResponses extends StatefulWidget {
  const EventResponses({super.key, required this.eventId});
  final int eventId;
  @override
  State<EventResponses> createState() => _EventResponsesState();
}

bool isExpanded = false;

class _EventResponsesState extends State<EventResponses> {
  late Future<List<ResponseModel>> responseData;
  ResponseList responseList = StudentResponseList();
  @override
  void initState() {
    responseData = responseList.getStudentResponse(widget.eventId);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: getDeviceWidth(context) * 0.5,
        height: getDeviceHeight(context) * 0.06,
        child: FloatingActionButton(
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
            foregroundColor: Theme.of(context).highlightColor,
            backgroundColor: Theme.of(context).primaryColor,
            child: Text(
              "Get Excel",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            onPressed: createExcel),
      ),
      backgroundColor: Theme.of(context).highlightColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Navigator.pop(context, true),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).highlightColor,
        title: Text(
          "Event responses",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Container(
        child: FutureBuilder<List<ResponseModel>>(
          future: responseData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data != null) {
              List<ResponseModel> eventList = snapshot.data!;

              return ListView(
                children: eventList
                    .map(
                      (data) => ExpansionTile(
                        backgroundColor: Theme.of(context).highlightColor,
                        collapsedBackgroundColor:
                            Theme.of(context).highlightColor,
                        title: Text(
                          data.usn!,
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Theme.of(context).canvasColor,
                              fontWeight: FontWeight.bold),
                        ),
                        children: [
                          ListTile(
                            title: Text(
                              "Name: ${data.studentName!}",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Theme.of(context).canvasColor),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dept: ${data.department!}",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Theme.of(context).canvasColor),
                                ),
                                Text(
                                  "Sem: ${data.semester!}",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Theme.of(context).canvasColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                        onExpansionChanged: (bool expanded) {
                          setState(() => isExpanded = expanded);
                        },
                      ), //ResponseFeed(studentData: data),
                    )
                    .toList(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Center(
                  child: Center(
                    child: Text("null"),
                  ),
                ),
              );
            } else if (snapshot.data == null) {
              return Text('Completed -> ${snapshot.error}');
            }
            return CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            );
          },
        ),
      ),
    );
  }
}

class ResponseFeed extends StatelessWidget {
  const ResponseFeed({
    Key? key,
    this.deviceWidth,
    this.deviceHeight,
    this.unitHeightValue,
    required this.studentData,
  }) : super(key: key);

  final deviceWidth;
  final deviceHeight;
  final ResponseModel studentData;
  final unitHeightValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Email",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          readOnlyTextField(
              "${studentData.studentEmail}", Theme.of(context).primaryColor),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Full Name",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          readOnlyTextField(
              studentData.studentName!, Theme.of(context).primaryColor),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "USN Number",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          readOnlyTextField(studentData.usn!, Theme.of(context).primaryColor),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Department",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          readOnlyTextField(
              studentData.department!, Theme.of(context).primaryColor),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Semester",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          readOnlyTextField(
              studentData.semester!, Theme.of(context).primaryColor),
        ],
      ),
    );
  }
}
