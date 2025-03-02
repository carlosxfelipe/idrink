import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final String? address;

  const CustomAppBar({super.key, this.showBackButton = false, this.address});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.colorScheme.surface,
      surfaceTintColor: theme.colorScheme.surface,
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
      title:
          address != null
              ? AddressAppBarContent(address: address!)
              : const SearchAppBarContent(),
      centerTitle: address != null,
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

class AddressAppBarContent extends StatelessWidget {
  final String address;

  const AddressAppBarContent({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      address,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: theme.colorScheme.onSurface,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class SearchAppBarContent extends StatelessWidget {
  const SearchAppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return SizedBox(
      height: 45,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Buscar...',
          hintStyle: TextStyle(
            color: theme.colorScheme.onSurface.withAlpha(153),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: theme.colorScheme.onSurface.withAlpha(179),
          ),
          filled: true,
          fillColor: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(color: theme.colorScheme.onSurface),
      ),
    );
  }
}
