import 'package:flutter/material.dart';
import 'package:idrink/routes/router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: router,
    );
  }
}
