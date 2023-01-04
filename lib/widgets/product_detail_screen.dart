import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
/*   final String title;
  ProductDetailScreen({required this.title});

 */
static const routeName='product_detail';
  @override
  Widget build(BuildContext context) {
    ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text("title"),),
    );
  }
}