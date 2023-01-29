import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/orders.dart' show Orders;
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/orders_item.dart';

class OrdersScreen extends StatelessWidget {
    static const routeName='/orders';



  @override
  Widget build(BuildContext context) {
   //final ordersdata=Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
        
      ),
      drawer: const AppDrawer(),
      body:FutureBuilder(
        future:  Provider.of<Orders>(context,listen: false).setAndFetchOrders(),
        builder: ((context,  AsyncSnapshot<dynamic> datasnapshot) {
          if (datasnapshot.connectionState==ConnectionState.waiting) {
            return  const Center(child: CircularProgressIndicator(),) ;
          } else if(datasnapshot.error!=null) {
            print(datasnapshot.connectionState);
            return const Center(child: Text(' Error occured !'),);
          }
          else{
            return Consumer<Orders>(builder: (context, ordersdata, _) => ListView.builder( itemCount: ordersdata.orders.length,itemBuilder: ((_, index) =>OrdersItem(ordersdata.orders[index]) ) ));
          }
        
      }))
    );
  }
}