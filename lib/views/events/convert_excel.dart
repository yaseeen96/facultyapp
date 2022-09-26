import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import '../../models/response_model.dart';

Future<ResponseModel> createExcel(List<ResponseModel> eventResponseList) async {
// Create a new Excel Document.
  final Workbook workbook = Workbook();

// Accessing worksheet via index.
  final Worksheet sheet = workbook.worksheets[0];

// Set the text value.
  sheet.getRangeByName('A1').setText('Student Name');
  sheet.getRangeByName('B1').setText('USN');
  sheet.getRangeByName('C1').setText('Department');
  sheet.getRangeByName('D1').setText('Semester');
  sheet.getRangeByName('E1').setText('Student Email');

  for (var i = 0; i < eventResponseList.length; i++) {
    sheet
        .getRangeByName('A${i + 2}')
        .setText('${eventResponseList[i].studentName}');
    sheet.getRangeByName('B${i + 2}').setText('${eventResponseList[i].usn}');
    sheet
        .getRangeByName('C${i + 2}')
        .setText('${eventResponseList[i].department}');
    sheet
        .getRangeByName('D${i + 2}')
        .setText('${eventResponseList[i].semester}');
    sheet
        .getRangeByName('E${i + 2}')
        .setText('${eventResponseList[i].studentEmail}');
  }

// Save and dispose the document.
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();

// Get external storage directory
  final directory = await getExternalStorageDirectory();

// Get directory path
  final path = directory!.path;

// Create an empty file to write Excel data
  File file = File('$path/Output.xlsx');

// Write Excel data
  await file.writeAsBytes(bytes, flush: true);

// Open the Excel document in mobile
  OpenFile.open('$path/Output.xlsx');

  return ResponseModel();
}
