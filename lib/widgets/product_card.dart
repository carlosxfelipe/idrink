import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productDetails;
  final double pricePerUnit;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onAdd;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.productDetails,
    required this.pricePerUnit,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onAdd,
  });

  double get totalPrice => pricePerUnit * quantity;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors:
                isDarkMode
                    ? [Colors.grey[800]!, Colors.grey[900]!]
                    : [Colors.grey[100]!, Colors.grey[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductInfo(
                imageUrl: imageUrl,
                productName: productName,
                productDetails: productDetails,
                pricePerUnit: pricePerUnit,
                totalPrice: totalPrice,
              ),
              const SizedBox(height: 8),
              ProductActions(
                quantity: quantity,
                onIncrement: onIncrement,
                onDecrement: onDecrement,
                onAdd: onAdd,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productDetails;
  final double pricePerUnit;
  final double totalPrice;

  const ProductInfo({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.productDetails,
    required this.pricePerUnit,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    productDetails,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color:
                          isDarkMode
                              ? Colors.grey.shade300
                              : Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.verified, color: Colors.blue, size: 16),
                ],
              ),
              const SizedBox(height: 8),
              PriceTag(pricePerUnit: pricePerUnit, totalPrice: totalPrice),
            ],
          ),
        ),
      ],
    );
  }
}

class PriceTag extends StatelessWidget {
  final double pricePerUnit;
  final double totalPrice;

  const PriceTag({
    super.key,
    required this.pricePerUnit,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Row(
      children: [
        Text(
          'R\$ ${pricePerUnit.toStringAsFixed(2).replaceAll('.', ',')}',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          constraints: const BoxConstraints(minWidth: 130),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:
                isDarkMode
                    ? Colors.greenAccent.withAlpha(50)
                    : Colors.green.withAlpha(50),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.shopping_cart,
                size: 16,
                color: isDarkMode ? Colors.greenAccent : Colors.green.shade800,
              ),
              const SizedBox(width: 4),
              Text(
                'R\$ ${totalPrice.toStringAsFixed(2).replaceAll('.', ',')}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color:
                      isDarkMode ? Colors.greenAccent : Colors.green.shade800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductActions extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onAdd;

  const ProductActions({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = colorScheme.onSurface;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle_outline, color: iconColor),
              onPressed: onDecrement,
            ),
            Container(
              width: 50,
              padding: const EdgeInsets.symmetric(vertical: 4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$quantity',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add_circle_outline, color: iconColor),
              onPressed: onIncrement,
            ),
          ],
        ),
        ElevatedButton(
          onPressed: onAdd,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            minimumSize: const Size(150, 48),
            shadowColor: Colors.black26,
            elevation: 4,
          ).copyWith(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.red.shade700;
              }
              return colorScheme.primary;
            }),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_shopping_cart,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                'ADICIONAR',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
