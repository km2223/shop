import 'package:flutter/material.dart';
import 'package:shop/screens/product_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(secondary: Colors.deepOrange),
        fontFamily: 'Lato'
      ),
      home: ProductOverviewScreen(),
    );
  }
}

