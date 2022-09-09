import 'package:flutter/material.dart';
import 'package:facultyapp/utils/configurations.dart';

class CseLogo extends StatelessWidget {
  const CseLogo({
    Key? key,
    required this.deviceHeight,
  }) : super(key: key);

  final deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(maxHeight: deviceHeight * 0.02),
      // margin: EdgeInsets.only(top: deviceHeight * 0.15),
      alignment: Alignment.center,
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
              Border.all(color: Theme.of(context).highlightColor, width: 4)),
      child: Text(
        "CSE",
        style: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).highlightColor),
      ),
    );
  }
}
