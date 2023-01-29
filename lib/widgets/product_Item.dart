import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/auth.dart';
import 'package:shop/provider/cart.dart';
import 'package:shop/provider/product.dart';
import 'package:shop/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
/*   final String id;
  final String title;
  final String imageUrl;
  ProductItem({
     required this.id,
     required this.imageUrl,
     required this.title
  }); */

  @override
  Widget build(BuildContext context) {
    final product=Provider.of<Product>(context,listen: false);
    final cart=Provider.of<Cart>(context,listen: false);
    final authData=Provider.of<Auth>(context,listen: false);


    return  ClipRRect(
        borderRadius: BorderRadius.circular(10 ),
        child:  GridTile( footer: GridTileBar(
          title:Text(product.title,
          textAlign: TextAlign.center,),
          backgroundColor:Colors.black87,
          leading:Consumer<Product>(
            builder: (BuildContext context, value, Widget? child) =>IconButton(icon:Icon(product.isfavorite? Icons.favorite:Icons.favorite_border) ,
            color: Theme.of(context).accentColor,
             onPressed: () { product.taggleFavoritestatus(authData.token as String,authData.userId);  },),
            
          ),
           trailing: IconButton(icon: const Icon(Icons.shopping_cart), 
           onPressed: () { 
            cart.addItem(product.id, product. price,product.title);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  content: const Text('add item to cart'),
  duration: const Duration(seconds: 2),
  action: SnackBarAction(label: ('undo'), onPressed: (() {
    cart.removeItem(product.id);
  })),
)
);
            

            },
          color: Theme.of(context).accentColor,
           ),
           ), child:GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed( ProductDetailScreen.routeName,arguments:product.id);
          },
          child: Image.network(product.imageUrl,
          fit:BoxFit.cover,
          ),
        ) ,
        ),
      );
      
  }
}