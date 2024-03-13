import 'package:flutter/material.dart';
import 'package:yody_login/main.dart';
import 'package:yody_profile/main.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routes',
      initialRoute: '/',
      routes: {
        '/yody_login': (context) => const YodyLogin(),
        '/yody_profile': (context) => const YodyProfile(),
      },
    );
  }
}