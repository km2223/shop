import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/orders.dart' show Orders;
import 'package:shop/widgets/orders_item.dart';

class OrdersScreen extends StatefulWidget {
    static const routeName='/orders';

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Orders>(context,listen: false).setAndFetchOrders();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final ordersdata=Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
      ),
      body:ListView.builder(itemBuilder: ((context, index) =>OrdersItem(ordersdata.orders[index]) ),itemCount: ordersdata.orders.length,) ,
    );
  }
}