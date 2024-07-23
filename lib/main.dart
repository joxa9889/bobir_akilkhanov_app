import 'package:bobir_akilkhanov/auth/data/auth.dart';
import 'package:bobir_akilkhanov/auth/page/log_in.dart';
import 'package:bobir_akilkhanov/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var routingPage;

  @override
  void initState() {
    super.initState();
    checkAuthAndNavigate();
  }

  Future<void> checkAuthAndNavigate() async {
    List<String?> authToken = await Auth.getRA();
    setState(() {
      routingPage = (authToken[0] != null) || (authToken[1] != null) ? const HomePage() : const LogInPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.black,
        ),
      ),
      home: routingPage,
    );
  }
}