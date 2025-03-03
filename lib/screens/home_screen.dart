import 'package:flutter/material.dart';
import 'package:idrink/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> products = [
    {
      "imageUrl":
          'https://merconnect-production.s3.amazonaws.com/uploads/products/221_200215_5cd93d7a-ae5f-4bb1-81a2-51131d1b6e64.png',
      "productName": 'Coca Cola 1l',
      "productDetails": 'Sabor Original',
      "pricePerUnit": 6.79,
      "quantity": 1,
    },
    {
      "imageUrl":
          'https://merconnect-production.s3.amazonaws.com/uploads/products/7894900031515-min.png',
      "productName": 'Fanta Laranja 2l',
      "productDetails": 'Sabor Original',
      "pricePerUnit": 8.79,
      "quantity": 1,
    },
  ];

  void _incrementQuantity(int index) {
    setState(() {
      products[index]["quantity"]++;
    });
  }

  void _decrementQuantity(int index) {
    if (products[index]["quantity"] > 1) {
      setState(() {
        products[index]["quantity"]--;
      });
    }
  }

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
                    const FeedbackWidget(),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductCard(
                          imageUrl: product["imageUrl"],
                          productName: product["productName"],
                          productDetails: product["productDetails"],
                          pricePerUnit: product["pricePerUnit"],
                          quantity: product["quantity"],
                          onIncrement: () => _incrementQuantity(index),
                          onDecrement: () => _decrementQuantity(index),
                          onAdd: () {
                            debugPrint(
                              '${product["productName"]} adicionado ao carrinho!',
                            );
                          },
                        );
                      },
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
