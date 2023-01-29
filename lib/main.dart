import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/auth.dart';
import 'package:shop/provider/cart.dart';
import 'package:shop/provider/orders.dart';
import 'package:shop/provider/products.dart';
import 'package:shop/screens/264%20auth_screen.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/edit_product_screen.dart';
import 'package:shop/screens/orders_screen.dart';
import 'package:shop/screens/product_overview_screen.dart';
import 'package:shop/screens/user_product_screen.dart';
import 'package:shop/screens/product_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
                ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth,Products>( create: (context) => Products('', [],''), update:(context, auth, previousProducts) =>Products(auth.token as String,previousProducts == null ? [] : previousProducts.items,auth.userId) , ),
        
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth,Orders>(create: (context) => Orders('', [],''), update:(context, auth, previousOrders) =>Orders(auth.token as String,previousOrders == null ? [] : previousOrders.orders,auth.userId )  ),

/*         ChangeNotifierProvider.value(
          value: Orders(),
        ), */
      ], 
    
      child:Consumer<Auth>(builder: ((context, auth, child) => MaterialApp(
        
        title: 'MyShop',
        theme: ThemeData(
          fontFamily: 'Lato', colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(secondary: Colors.deepOrange)
    
        ),
        
        home:auth.isAuth? ProductOverviewScreen() :AuthScreen(),
        
        //
        routes: {
          ProductDetailScreen.routeName:(context) => ProductDetailScreen(),
          CartScreen.routName:(context) => CartScreen(),
          OrdersScreen.routeName:(context) => OrdersScreen(),
          UserProduct.routeName:(context) => UserProduct(),
          EditProductScreen.routeName:(context) => EditProductScreen(),


        },
      ) ))
 
      );
    
  }
}

