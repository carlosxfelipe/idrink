import 'package:flutter/material.dart';
import 'package:idrink/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _quantity = 1;
  final double _pricePerUnit = 7.50;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  double get totalPrice => _quantity * _pricePerUnit;

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
                  children: [
                    const CarouselWidget(indicatorColor: Colors.red),
                    const SizedBox(height: 10),
                    const CategoriesWidget(),
                    const SizedBox(height: 20),
                    ProductCard(
                      imageUrl:
                          'https://m.media-amazon.com/images/I/71DosOw6ZvL._AC_SL1500_.jpg',
                      productName: 'Coca-Cola 2L',
                      productDetails: 'Refrigerante',
                      pricePerUnit: _pricePerUnit,
                      quantity: _quantity,
                      onIncrement: _incrementQuantity,
                      onDecrement: _decrementQuantity,
                      onAdd: () {},
                    ),
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
