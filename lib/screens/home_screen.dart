import 'package:flutter/material.dart';
import 'package:idrink/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _handleAddressTap() {
    debugPrint('Endereço tocado!');
  }

  @override
  Widget build(BuildContext context) {
    return ConvexBottomBar(
      currentIndex: 0,
      child: Scaffold(
        appBar: CustomAppBar(
          showBackButton: false,
          address: "Rua das Flores, 123",
          onAddressTap: _handleAddressTap,
        ),
        body: Column(
          children: const [
            SizedBox(height: 20),
            CarouselWidget(indicatorColor: Colors.red),
          ],
        ),
      ),
    );
  }
}
