import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/cart.dart';
import 'package:shop/provider/orders.dart';
import 'package:shop/provider/products.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/edit_product_screen.dart';
import 'package:shop/screens/orders_screen.dart';
import 'package:shop/screens/product_overview_screen.dart';
import 'package:shop/screens/user_product_screen.dart';
import 'package:shop/widgets/product_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) =>Products() ,),
      ChangeNotifierProvider(create: (context) =>Cart() ,),
      ChangeNotifierProvider(create: (context) =>Orders() ,)



    ],
    
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato'
    
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName:(context) => ProductDetailScreen(),
          CartScreen.nameRoute:(context) => CartScreen(),
          OrdersScreen.routeName:(context) => OrdersScreen(),
          UserProduct.routeName:(context) => UserProduct(),
          EditProductScreen.routeName:(context) => EditProductScreen()

        },
      ));
    
  }
}

