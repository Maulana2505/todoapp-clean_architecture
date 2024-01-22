


import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/mediaquery.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/locator.dart';

Widget button(BuildContext context, Function onPressed){
   return ElevatedButton(
      onPressed: onPressed(),
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10),
          backgroundColor: Color(sl.get<Colorss>().colors2),
          minimumSize: Size(displayWidth(context) * 0.9, displayWidth(context) * 0.12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0),
      child: Text(
        'Signin',
        style: TextStyle(color: Colors.white38),
      ),
    );
}