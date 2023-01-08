import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/products.dart';
import 'package:shop/screens/edit_product_screen.dart';
import 'package:shop/widgets/user_product_item.dart';

class UserProduct extends StatelessWidget {
static const routeName='/user-product';
  @override
  Widget build(BuildContext context) {
    final productdata= Provider.of<Products>(context);
    return Scaffold(
      appBar:AppBar(title:const Text('Your Product'),
      actions: [
        IconButton(onPressed: (() {
          Navigator.of(context).pushNamed(EditProductScreen.routeName);
        }), icon: const Icon(Icons.add))
      ],
      ),
      body: Padding(padding: const EdgeInsets.all(10),
      child: ListView.builder(itemBuilder: ((context, index) => Column(
        children: [
          UserProductItem(id: productdata.items[index].id, title: productdata.items[index].title, imageUrl: productdata.items[index].imageUrl),
          const Divider()
        ],
      )
      ),itemCount:productdata.items.length),
      ),
      
    );
  }
}