import 'package:flutter/material.dart';

Widget testableWidget({Widget widgetUnderTest}) => MaterialApp(
      home: Scaffold(
        body: widgetUnderTest,
      ),
    );
