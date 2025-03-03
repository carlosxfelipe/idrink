import 'package:flutter/material.dart';
import 'package:idrink/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _quantity = 1;
  final double _pricePerUnit = 6.79;

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
                    ProductCard(
                      imageUrl:
                          'https://merconnect-production.s3.amazonaws.com/uploads/products/221_200215_5cd93d7a-ae5f-4bb1-81a2-51131d1b6e64.png',
                      productName: 'Coca Cola 1l',
                      productDetails: 'Sabor Original',
                      pricePerUnit: _pricePerUnit,
                      quantity: _quantity,
                      onIncrement: _incrementQuantity,
                      onDecrement: _decrementQuantity,
                      onAdd: () {},
                    ),
                    const SizedBox(height: 100),
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
