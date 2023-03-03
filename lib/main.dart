import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_data/screens/home/provider/home_provider.dart';
import 'package:student_data/screens/home/view/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
        },
      ),
    ),
  );
}