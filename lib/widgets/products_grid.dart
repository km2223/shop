import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provvider/products.dart';
import 'package:shop/widgets/product_Item.dart';

import '../models/product.dart';

class ProductGrid extends StatelessWidget {





  @override
  Widget build(BuildContext context) {
      final productsData=Provider.of<Products>(context);
  
  
  final products=productsData.items;
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10 
        ), 
      itemBuilder: ((context, i) => ProductItem(id: products[i].id, imageUrl: products[i].imageUrl, title: products[i].title)));
  }
}