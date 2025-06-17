import 'package:animationdemo/explicitAnimationDemo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Animation Demo")),
        body: Explicitanimationdemo(),
      ),
    ),
  );
}
