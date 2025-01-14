import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gd_api2_1686/pages/Homepage.dart';

void main() {
  // Aplikasi dibungkus ProviderScope agar bisa menggunakan Riverpod
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), // tema data
      home: Homepage(),
    ); // MaterialApp
  }
}
