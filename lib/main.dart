import 'package:flutter/material.dart';
import 'package:idrink/routes/router.dart';
import 'package:idrink/widgets.dart';

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
          seedColor: Colors.blue,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: router,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConvexBottomBar(
      currentIndex: 0,
      child: Scaffold(
        appBar: CustomAppBar(showBackButton: false),
        body: Column(
          children: [
            SizedBox(height: 20),
            CarouselWidget(indicatorColor: Colors.red),
          ],
        ),
      ),
    );
  }
}
