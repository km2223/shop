import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provvider/cart.dart';
import 'package:shop/provvider/products.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/product_overview_screen.dart';
import 'package:shop/widgets/product_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create:((context) =>  Products()),
      ),
      ChangeNotifierProvider(create:((context) =>  Cart()),
)
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

        },
      ));
    
  }
}

