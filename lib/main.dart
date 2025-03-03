import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:idrink/routes/router.dart';
import 'package:idrink/theme/theme.dart';
import 'package:idrink/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    final theme = Theme.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarColor:
            isDarkMode ? Colors.grey[900]! : theme.colorScheme.surface,
        systemNavigationBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeProvider.themeMode,
        routerConfig: router,
      ),
    );
  }
}
