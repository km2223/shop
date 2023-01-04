import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provvider/product.dart';
import 'package:shop/provvider/products.dart';

class ProductDetailScreen extends StatelessWidget {
/*   final String title;
  ProductDetailScreen({required this.title});

 */
static const routeName='product_detail';
  @override
  Widget build(BuildContext context) {
   final productId= ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct=Provider.of<Products>(context,listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title),),
    );
  }
}