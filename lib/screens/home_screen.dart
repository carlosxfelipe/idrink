import 'package:flutter/material.dart';
import 'package:idrink/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConvexBottomBar(
      currentIndex: 0,
      child: Scaffold(
        appBar: CustomAppBar(
          showBackButton: false,
          address: "Rua das Flores, 123",
        ),
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
