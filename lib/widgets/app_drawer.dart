
import 'package:flutter/material.dart';

import 'package:shop/screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('hello'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading:Icon(Icons.shop,),
            title: const Text('shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersScren.routeName);
            },
            ),
                      const Divider(),
          ListTile(
            leading:Icon(Icons.payment,),
            title: const Text('orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersScren.routeName);
            },
            )
        ],
      ),
    );
  }
}