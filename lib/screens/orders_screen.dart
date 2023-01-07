import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provvider/orders.dart' show Orders;
import 'package:shop/widgets/orders_item.dart';

class OrdersScren extends StatelessWidget {
    static const routeName='/orders';


  @override
  Widget build(BuildContext context) {
    final ordersdata=Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body:ListView.builder(itemBuilder: ((context, index) =>OrdersItem(ordersdata.orders[index]) ),itemCount: ordersdata.orders.length,) ,
    );
  }
}