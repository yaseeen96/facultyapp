import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  const customButton({
    Key? key,
    required this.deviceHeight,
    required this.deviceWidth,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final double deviceHeight;
  final double deviceWidth;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: deviceHeight * 0.075,
        width: deviceWidth * 0.75,
        padding: EdgeInsets.all(deviceHeight * 0.01),
        decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
