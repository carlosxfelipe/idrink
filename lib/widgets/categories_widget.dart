import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int? selectedIndex;

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
  Widget build(BuildContext context) {
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
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: isSelected ? Colors.red : Colors.grey[200],
                  radius: 28,
                  child: Icon(
                    categories[index]['icon'],
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  categories[index]['label'],
                  style: const TextStyle(fontSize: 12),
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
