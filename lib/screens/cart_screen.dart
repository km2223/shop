import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provvider/cart.dart' show Cart;
import 'package:shop/provvider/orders.dart';
import '../widgets/cart_item.dart' ;
class CartScreen extends StatelessWidget {
   static  const  nameRoute='/cart';

  const CartScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<Cart>(context);

    return Scaffold(
      appBar:AppBar(
        title: const Text("Your Cart"),
      ),
      body:Column(
        children: [
          Card(
            margin:const EdgeInsets.all(15),
            child:Padding(padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tatal',style: TextStyle(
                  fontSize: 20,
                ),
                ),
                const SizedBox(width: 10,),
                const Spacer(),
                Chip(label: Text('\$${cart.totalAmount.toString()}',
                style: const TextStyle(
                  
                ),
                ),
                
                backgroundColor:Theme.of(context).primaryColor,
                
                ),
                ElevatedButton(child: const Text('ORDER NOW'),
                onPressed: () {
/*                   Provider.of<Orders>(context).addOrder(cart.items.values.toList(),
                   cart.totalAmount); */
                   cart.clear();
                },)
              ],
            ),
            ),
          ),
          Expanded( child: ListView.builder(
             itemCount: cart.items.length,
             itemBuilder: (context, index) => CartItem(
               productId: cart.items.keys.toList()[index],
              id: cart.items.values.toList()[index].id,
               price: cart.items.values.toList()[index].price, 
               title: cart.items.values.toList()[index].title, 
               quantity: cart.items.values.toList()[index].quantity),))
        ],
      ),
    );
  }
}