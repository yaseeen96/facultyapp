import 'package:flutter/material.dart';

import '../utils/configurations.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    this.isPassword,
    required this.controller,
    required this.controllerName,
  }) : super(key: key);

  final bool? isPassword;
  final TextEditingController controller;
  final String controllerName;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _passwordVisible = false;
  @override
  initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isPassword == true) {
      return Container(
        width: getDeviceWidth(context) * 0.8,
        child: TextFormField(
          obscureText: !_passwordVisible,
          cursorColor: Theme.of(context).primaryColor,
          controller: widget.controller,
          decoration: InputDecoration(
            labelText: "${widget.controllerName}",
            labelStyle: TextStyle(color: Colors.grey),
            hintText: "Enter ${widget.controllerName}",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
              child: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: getDeviceWidth(context) * 0.8,
        child: TextFormField(
          cursorColor: Theme.of(context).primaryColor,
          controller: widget.controller,
          decoration: InputDecoration(
            labelText: "${widget.controllerName}",
            labelStyle: TextStyle(color: Colors.grey),
            hintText: "Enter ${widget.controllerName}",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    }
  }
}
