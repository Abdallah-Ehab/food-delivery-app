import 'package:delivery_app/models/restaurant.dart';
import 'package:delivery_app/screens/log_in_screen.dart';
import 'package:delivery_app/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>ThemeManager()),
    ChangeNotifierProvider(create: (context)=>Restaurant())
  ],child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeManager themeManager = Provider.of<ThemeManager>(context);
      return MaterialApp(
        theme: themeManager.lightTheme,
        darkTheme: themeManager.darkTheme,
        themeMode: themeManager.themeMode,
        home: const LogInScreen(),
      );
  }
}
