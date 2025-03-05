import 'package:flutter/material.dart';
import 'package:profit11/otp.dart';
import 'package:profit11/register.dart';
import 'package:profit11/login.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => Login(), // Default route (Login screen)
        '/register': (context) => Register(), // Register screen
        '/otp': (context) => Verification(),
      },
      initialRoute: '/',
    );
  }
}
