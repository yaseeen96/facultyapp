import 'package:facultyapp/interfaces/add_event_image_interface.dart';
import 'package:facultyapp/services/add_event_image_service.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:facultyapp/interfaces/event_image_interface.dart';
import 'package:facultyapp/interfaces/event_interface.dart';
import 'package:facultyapp/models/event_image_model.dart';
import 'package:facultyapp/services/event_image_service.dart';

import 'package:facultyapp/utils/configurations.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/events_model.dart';

import 'dart:io';
// import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'package:syncfusion_flutter_xlsio/xlsio.dart';

class EventPictures extends StatefulWidget {
  EventPictures({super.key, required this.eventData});

  final EventsModel eventData;
  @override
  State<EventPictures> createState() => _EventPicturesState();
}

class _EventPicturesState extends State<EventPictures> {
  late Future<List<EventsImageModel>> _data;

// get images
  final ImageList _eventImage = EventImageList();
  late List<EventsImageModel> imageList;

//post image
  final AddEventImage _addEventImage = CollegeAddEventImage();

  // image picker function start
  // stores images selected in a list imageFileList

  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];

  void selectImages() async {
    List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    // print("Image List Length:" + imageFileList!.length.toString());
    // imageFileList!.forEach((element) {
    //   print(element);
    // });

    setState(() {});
  }

  // end of image picker function
  List<String>? fileList;
  void convertToFile() {
    for (var i = 0; i < imageFileList!.length; i++) {
      fileList![i] = imageFileList![i].path;
      print("Hey there ${fileList![i]}");
    }
    ;
  }

  @override
  void initState() {
    // TODO: implement initState

    _data = _eventImage.getEventsImage();
  }

  @override
  Widget build(BuildContext context) {
    // defining event images list

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          foregroundColor: Theme.of(context).highlightColor,
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.add),
          onPressed: () async {
            selectImages();
            convertToFile();
            await _addEventImage.addEventImages(fileList, widget.eventData);
          }),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          color: Theme.of(context).primaryColor,
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context, true),
        ),
        backgroundColor: Theme.of(context).highlightColor,
        title: Text(
          "Event Pictures",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: FutureBuilder<List<EventsImageModel>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            imageList = snapshot.data!;
            print("Image List : ${imageList}");
            return GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              children: imageList
                  .map((e) => EventImageView(dataList: e))
                  .where((element) =>
                      element.dataList.event!.id == widget.eventData.id)
                  .toList(),
            );
          } else if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
          return Center(child: Text("No Data"));
        },
      ),
      backgroundColor: Theme.of(context).highlightColor,
    );
  }
}

class EventImageView extends StatelessWidget {
  const EventImageView({Key? key, required this.dataList}) : super(key: key);

  final EventsImageModel dataList;

  @override
  Widget build(BuildContext context) {
    return FullScreenWidget(
      backgroundColor: Theme.of(context).highlightColor,
      child: Center(
        child: Container(
          width: getDeviceWidth(context),
          height: getDeviceHeight(context) * 0.5,
          child: Image.network(
            width: 20,
            height: 10,
            "${dataList.eventImage}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
