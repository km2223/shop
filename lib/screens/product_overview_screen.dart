import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/cart.dart';
import 'package:shop/provider/product.dart';
import 'package:shop/provider/products.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/badge.dart';
import 'package:shop/widgets/product_Item.dart';

import '../widgets/products_grid.dart';

enum FilterValue{Favorite,All}
class ProductOverviewScreen extends StatefulWidget {

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorite=false;
  var _isInit=true;
  var _isLoaded=false;
  @override
  void didChangeDependencies() {
    if(_isInit){
      setState(() {
        _isLoaded=true;
      });
 Provider.of<Products>(context,).fetchAndSetProduct().then((_) {

setState(() {
  _isLoaded=false;
  
}); });
    }
    _isInit=false;
    super.didChangeDependencies();
  }
@override
  void initState() {
   /* Future.delayed(Duration.zero).then((_) {
      Provider.of<Products>(context,listen: false).fetchAndSetProduct();
    }); */ 
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title:const Text('MyShop'),
      actions: [
        PopupMenuButton(onSelected: ( FilterValue selectedValue) {
          setState(() {
                      if(selectedValue==FilterValue.Favorite){
            _showOnlyFavorite=true;

          }else{
            _showOnlyFavorite=false;

          }
          });


        },

          icon:const Icon(Icons.more_vert),itemBuilder: ((context) => [
          const PopupMenuItem(value: FilterValue.Favorite,child: Text('only favorite'),
          ),
          const PopupMenuItem(value:FilterValue.All,child: Text('show all'),
          )
        ]
        )
        ),
        Consumer<Cart>(builder: ((context, cart, ch) => Badge(value: cart.itemCount.toString(),
         color: Colors.black, child:ch as Widget)
        ),
        child: IconButton(icon:const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.of(context).pushNamed(CartScreen.routName);
        },
        ),
        )

      ],
      ),
      drawer: const AppDrawer(),
      body:_isLoaded ? const Center(child: CircularProgressIndicator(),) :ProductGrid(_showOnlyFavorite),
    
    );
  }
}

