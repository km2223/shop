import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/cart.dart'show Cart;

import '../provider/orders.dart';

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
  var _isloading=false;

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<Cart>(context);
    
    return ElevatedButton(onPressed:(widget. cart.totalAmount<=0||_isloading)? null:()async {
      setState(() {
        _isloading=true;
      });
    await  Provider.of<Orders>(context,listen: false).addOrder(widget. cart.items.values.toList(),widget.cart.totalAmount); 
    setState(() {
      _isloading=false;
    });
      //cart.clear();
    },child:_isloading?const CircularProgressIndicator(): const Text('ORDER NOW'),);
  }
}