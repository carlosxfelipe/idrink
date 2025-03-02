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
          children: [
            const WelcomeWidget(),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    CarouselWidget(indicatorColor: Colors.red),
                    SizedBox(height: 10),
                    CategoriesWidget(),
                    SizedBox(height: 300),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
