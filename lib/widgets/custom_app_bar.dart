import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final String? address;
  final VoidCallback? onAddressTap;

  const CustomAppBar({
    super.key,
    this.showBackButton = false,
    this.address,
    this.onAddressTap,
  });

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
              ? AddressAppBarContent(address: address!, onTap: onAddressTap)
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
  final VoidCallback? onTap;

  const AddressAppBarContent({super.key, required this.address, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = theme.colorScheme.onSurface;

    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on, color: iconColor, size: 20),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              address,
              style: TextStyle(
                color: theme.colorScheme.onSurface,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 6),
          Icon(Icons.expand_more, color: iconColor, size: 20),
        ],
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
