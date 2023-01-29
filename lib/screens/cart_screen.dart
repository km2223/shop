import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart' show Cart;
import 'package:shop/provider/orders.dart';
import '../widgets/cart_item.dart' ;
import '../screens/order_button.dart';
class CartScreen extends StatelessWidget {
   static  const  routName='/cart';



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
                Chip(label: Text('\$${cart.totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                  
                ),
                ),
                
                backgroundColor:Theme.of(context).primaryColor,
                
                ),
                OrderButton(cart: cart)
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
/*
class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(onPressed: widget.cart.totalAmount<=0? null:() {
     Provider.of<Orders>(context).addOrder(cart.items.values.toList(), cart.totalAmount); 
       //widget.cart.clear();
    },child: const Text('ORDER NOW'),);
  }
}*/