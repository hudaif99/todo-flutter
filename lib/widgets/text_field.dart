import 'package:flutter/material.dart';
import '../utils/font_constants.dart';

class CommonTextfield extends StatelessWidget {
  final String hintText;
  final int? maxLines;
  final double? height;
  final TextEditingController controller;

  const CommonTextfield(
      {Key? key,
        required this.hintText,
        this.maxLines,
        this.height,
        required this.controller,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: height ?? 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          controller: controller,
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(
            filled: true,isDense: true,
            fillColor: Theme.of(context).buttonTheme.colorScheme!.primary,
            hintText: hintText,
            hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF5D5D5D)),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
    );
  }
}
