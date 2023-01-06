import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provvider/cart.dart';
import 'package:shop/provvider/product.dart';
import 'package:shop/provvider/products.dart';
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

final List<Product> loadedProduct=[
  

  
];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title:Text('MyShop'),
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

          icon:Icon(Icons.more_vert),itemBuilder: ((context) => [
          PopupMenuItem(child: Text('only favorite'),value: FilterValue.Favorite,
          ),
          PopupMenuItem(child: Text('show all'),value:FilterValue.All,
          )
        ]
        )
        ),
        Consumer<Cart>(builder: ((context, cart, ch) => Badge(child:ch as Widget , value: cart.itemCount.toString(),
         color: Colors.black)
        ),
        child: IconButton(icon:Icon(Icons.shopping_cart),
        onPressed: () {
          
        },
        ),
        )

      ],
      ),
      
      body:ProductGrid(_showOnlyFavorite),
    
    );
  }
}

