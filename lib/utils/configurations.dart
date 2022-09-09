import 'package:flutter/material.dart';

getDeviceWidth(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width;
}

getDeviceHeight(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  return height;
}
