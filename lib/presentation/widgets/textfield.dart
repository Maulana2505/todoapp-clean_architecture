import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/mediaquery.dart';

Widget filds(BuildContext context, TextEditingController controller,
    String hint, double width, double height) {
  return Container(
    width: displayWidth(context) * width,
    height: displayHeight(context) * height,
    child: TextField(
      controller: controller,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38),
          // border: ,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          filled: true,
          contentPadding: EdgeInsets.all(20),
          fillColor: Colors.grey.withOpacity(0.4)),
    ),
  );
}

// Color.fromARGB(69, 241, 241, 241)
