import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;

  const CustomAppBar({super.key, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return AppBar(
      backgroundColor: isDarkMode ? theme.colorScheme.surface : Colors.white,
      surfaceTintColor: isDarkMode ? theme.colorScheme.surface : Colors.white,
      leading:
          showBackButton && Navigator.canPop(context)
              ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: theme.colorScheme.onSurface,
                ),
                onPressed: () => Navigator.pop(context),
              )
              : null,
      title: SizedBox(
        height: 45,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Buscar...',
            hintStyle: TextStyle(
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
            filled: true,
            fillColor: isDarkMode ? theme.colorScheme.surface : Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: theme.colorScheme.primary),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
          style: TextStyle(color: theme.colorScheme.onSurface),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, color: theme.colorScheme.onSurface),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
