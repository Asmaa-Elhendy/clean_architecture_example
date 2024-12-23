import 'package:clean_architecture_project/core/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Posts App',
      theme: appTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
        ),
        body: Center(
          child: Container(
            child: Text("Hello world"),
          ),
        ),
      ),
    );
  }
}
