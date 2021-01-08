import 'package:flutter/material.dart';
import 'package:ola_mundo/controller/app_controller.dart';
import 'package:ola_mundo/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Clone Contador',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: AppController.instance.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage(title: 'Contador Clone Flutter'),
        );
      },
    );
  }
}
