import 'package:flutter/material.dart';
import 'dart:math';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget>
    with SingleTickerProviderStateMixin {
  int? selectedIndex;
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.fastfood, 'label': 'Restaurantes'},
    {'icon': Icons.shopping_basket, 'label': 'Mercados'},
    {'icon': Icons.local_pharmacy, 'label': 'Farmácias'},
    {'icon': Icons.card_giftcard, 'label': 'Prêmios'},
    {'icon': Icons.monetization_on, 'label': 'Moedas'},
    {'icon': Icons.local_offer, 'label': 'Promoções'},
    {'icon': Icons.pets, 'label': 'Pet Shops'},
    {'icon': Icons.local_drink, 'label': 'Bebidas'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: pi / 8), weight: 1),
      TweenSequenceItem(tween: Tween(begin: pi / 8, end: -pi / 8), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -pi / 8, end: pi / 16), weight: 2),
      TweenSequenceItem(tween: Tween(begin: pi / 16, end: 0), weight: 1),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onCategoryTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _onCategoryTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[900] : Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Transform.rotate(
                    angle: selectedIndex == index ? _animation.value : 0,
                    child: Icon(
                      categories[index]['icon'],
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  categories[index]['label'],
                  style: TextStyle(
                    fontSize: 13,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
