
import 'package:flutter/material.dart';

import 'package:shop/screens/orders_screen.dart';
import 'package:shop/screens/user_product_screen.dart';

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
            leading:const Icon(Icons.shop,),
            title: const Text('shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            ),
                      const Divider(),
          ListTile(
            leading:const Icon(Icons.payment,),
            title: const Text('orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
            },
            ),
                                  const Divider(),
          ListTile(
            leading:const Icon(Icons.edit,),
            title: const Text('Manage Products'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(UserProduct.routeName);
            },
            )
        ],
      ),
    );
  }
}