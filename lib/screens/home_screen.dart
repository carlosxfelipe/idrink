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
            WelcomeWidget(),
            SizedBox(height: 20),
            CarouselWidget(indicatorColor: Colors.red),
            SizedBox(height: 20),
            CategoriesWidget(),
          ],
        ),
      ),
    );
  }
}

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Olá, Carlos Felipe',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              debugPrint('Ver meu Clube clicado!');
            },
            style: TextButton.styleFrom(
              foregroundColor: theme.colorScheme.primary,
            ),
            child: const Text('Ver meu Clube'),
          ),
        ],
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 28,
                child: Icon(categories[index]['icon'], color: Colors.black87),
              ),
              const SizedBox(height: 4),
              Text(
                categories[index]['label'],
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
