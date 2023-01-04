import 'package:flutter/material.dart';
import 'package:shop/provvider/product.dart';
import 'package:shop/widgets/product_Item.dart';

import '../widgets/products_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
final List<Product> loadedProduct=[
  

  
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('MyShop')),
      body:ProductGrid(),
    );
  }
}

