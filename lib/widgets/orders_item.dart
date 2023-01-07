import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:shop/provvider/orders.dart' as od;

class OrdersItem extends StatelessWidget {
final od.OrderItem orders; 
OrdersItem(this.orders);
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${orders.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy').format(orders.dateTime)
            ),
            trailing: IconButton(icon: Icon(Icons.expand_more),onPressed: (() {
              
            })),
          )
        ],
      ),
    );
  }
}