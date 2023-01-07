import 'package:flutter/material.dart';
import 'package:shop/widgets/cart_item.dart';


class OrderItem {
  final String id;
  final double amount;
   final List<CartItem>product;
   final DateTime dateTime;

  OrderItem({required this.id, required this.amount, required this.product,required this.dateTime});

}
class Orders with ChangeNotifier{
  List<OrderItem>_orders=[];
  List<OrderItem> get orders{
    return [..._orders];
  }
  void addOrder(List<CartItem> cartProduct,double total){
    _orders.insert(0, OrderItem(id: DateTime.now().toString(), amount: total, product: cartProduct, dateTime: DateTime.now()));
    notifyListeners();

  }

}