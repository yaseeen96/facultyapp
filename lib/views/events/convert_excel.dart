import 'dart:io';
// import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'package:syncfusion_flutter_xlsio/xlsio.dart';

Future<void> createExcel() async {
// Create a new Excel Document.
  final Workbook workbook = Workbook();

// Accessing worksheet via index.
  final Worksheet sheet = workbook.worksheets[0];

// Set the text value.
  sheet.getRangeByName('A1').setText('Student Name');
  sheet.getRangeByName('A2').setText('USN');
  sheet.getRangeByName('A3').setText('Department');
  sheet.getRangeByName('A4').setText('Semester');
  sheet.getRangeByName('A5').setText('Student Email');

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
  // OpenFile.open('$path/Output.xlsx');
}
