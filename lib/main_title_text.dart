import 'package:flutter/material.dart';

class MainTitleText extends Text {
  String data;
  MainTitleText({required this.data}): super(
    data,
    style: TextStyle(
      fontSize: 25,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold
    )
  );
}