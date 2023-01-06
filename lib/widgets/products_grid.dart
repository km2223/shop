import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provvider/products.dart';
import 'package:shop/widgets/product_Item.dart';

import '../provvider/product.dart';

class ProductGrid extends StatelessWidget {

final bool showFavs;
ProductGrid(this.showFavs);



  @override
  Widget build(BuildContext context) {
      final productsData=Provider.of<Products>(context);
  final products=showFavs?productsData.favoriteItems: productsData.items;
  
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10 
        ), 
      itemBuilder: ((context, i) => ChangeNotifierProvider.value(value: products[i],
      child: ProductItem(),
      )));
  }
}