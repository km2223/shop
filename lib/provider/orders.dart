import 'package:flutter/material.dart';
import '../provider/cart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class OrderItem {
  final String id;
  final double amount;
   final List<CartItem>products;
   final DateTime dateTime;

  OrderItem({required this.id, required this.amount, required this.products,required this.dateTime});

}
class Orders with ChangeNotifier{
  Orders(this.authToken,this._orders,this.userId);
  List<OrderItem>_orders=[];
  final String authToken;
  final String userId;
  List<OrderItem> get orders{
    return [..._orders];
  }
  
  Future<void>setAndFetchOrders() async{
   // setAndFetchOrders();
    final url =Uri.parse('https://shopapp-99ffc-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken');
    final response= await http.get(url);
    final extractedData=json.decode(response.body)as Map<String,dynamic>?;
    if(extractedData==null){return;}
    final List<OrderItem>loadedOrder=[];

    extractedData.forEach((orderId, orderData) { 
      loadedOrder.add(OrderItem(
        id: orderId,
         amount: orderData['amount'],
          products: (orderData['products'] as List<dynamic>).map((item) =>CartItem(
            id:item['id'] ,
             price: item['price'],
              title: item['title'], 
              quantity: item['quantity']) 
              ).toList(),
               dateTime: DateTime.parse(orderData['dateTime'])));
    });
  _orders=loadedOrder;
  notifyListeners();
  }
 Future< void >addOrder(List<CartItem> cartProducts,double total) async{
    final url =Uri.parse('https://shopapp-99ffc-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken');
    final timestamp=DateTime.now();
     final response= await http.post(url,body:json.encode({
      'amount':total,
      'dateTime':timestamp.toIso8601String(),
      'products':cartProducts.map(
        (cp) => {
          'id':cp.id,
          'price':cp.price,
          'quantity':cp.quantity,
          'title':cp.title

        }
        ).toList()

     }) );


    _orders.insert(0,
     OrderItem(
      id: json.decode(response.body)['name'],
       amount: total, products: cartProducts,
        dateTime: DateTime.now()
        ));
    notifyListeners();

  }

}