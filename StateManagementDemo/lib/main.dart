import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagementdemo/FirstScreen.dart';
import 'package:statemanagementdemo/ListProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NumberListProvider()),
      ],
      child: MaterialApp(home: Firstscreen()),
    ),
  );
}
