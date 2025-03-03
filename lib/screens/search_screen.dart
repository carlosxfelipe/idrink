import 'package:flutter/material.dart';
import 'package:idrink/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return ConvexBottomBar(
      currentIndex: 1,
      child: Scaffold(
        appBar: CustomAppBar(showBackButton: false),
        body: Column(children: const [SizedBox(height: 10)]),
      ),
    );
  }
}
