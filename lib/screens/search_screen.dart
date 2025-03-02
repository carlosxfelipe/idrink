import 'package:flutter/material.dart';
import 'package:idrink/widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConvexBottomBar(
      currentIndex: 1,
      child: Scaffold(
        appBar: CustomAppBar(showBackButton: false),
        body: Column(
          children: const [
            SizedBox(height: 20),
            // CarouselWidget(indicatorColor: Colors.red),
          ],
        ),
      ),
    );
  }
}
