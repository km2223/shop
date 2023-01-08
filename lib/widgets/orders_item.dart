import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/provider/orders.dart' as od;

class OrdersItem extends StatefulWidget {
final od.OrderItem orders; 
OrdersItem(this.orders);

  @override
  State<OrdersItem> createState() => _OrdersItemState();
}

class _OrdersItemState extends State<OrdersItem> {
  var _expand=false;
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.orders.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy').format(widget.orders.dateTime)
            ),
            trailing: IconButton( icon: Icon( _expand ?Icons.expand_less: Icons.expand_more),onPressed: (() {
              setState(() {
                _expand=!_expand;
              });
            })),
          ),
          if(_expand) Container(height: min(widget.orders.product.length*20 +100, 180),
          child: ListView(
            children: widget.orders.product.map((e) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                Text(e.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                ),
                Text('${e.quantity}x\$${e.price}',style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),)
              ],
            )
            ).toList(),
          ),
          )
        ],
      ),
    );
  }
}