import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConvexBottomBar extends StatelessWidget {
  final int currentIndex;
  final Widget child;

  const ConvexBottomBar({
    super.key,
    required this.currentIndex,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: ConvexAppBar(
        height: 60,
        style: TabStyle.react,
        backgroundColor:
            isDarkMode ? Colors.grey[900] : theme.colorScheme.surface,
        activeColor: isDarkMode ? Colors.white : Colors.black,
        color: isDarkMode ? Colors.white70 : Colors.black54,
        initialActiveIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) return;

          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/partnership');
              break;
            case 2:
              context.go('/offers');
              break;
            case 3:
              context.go('/payment');
              break;
            case 4:
              context.go('/profile');
              break;
          }
        },
        items: const [
          TabItem(icon: Icons.home, title: 'Início'),
          TabItem(icon: Icons.handshake, title: 'Parceria'),
          TabItem(icon: Icons.star_outline, title: 'Para Você'),
          TabItem(icon: Icons.receipt, title: 'Faturas'),
          TabItem(icon: Icons.person, title: 'Perfil'),
        ],
      ),
    );
  }
}
