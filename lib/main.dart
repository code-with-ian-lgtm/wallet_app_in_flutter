import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/pages/home_page.dart';
import 'package:wallet_app/themes/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        //themeprovider
        ChangeNotifierProvider(create: (context) => ThemeProvider())
      ],
      child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      
    );
  }
}