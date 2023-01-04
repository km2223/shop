import 'package:flutter/material.dart';
import 'package:shop/widgets/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  ProductItem({
     required this.id,
     required this.imageUrl,
     required this.title
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10 ),
      child:  GridTile( child:GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed( ProductDetailScreen.routeName,arguments: id);
        },
        child: Image.network(imageUrl,
        fit:BoxFit.cover,
        ),
      ) ,
      footer: GridTileBar(
        title:Text(title,
        textAlign: TextAlign.center,),
        backgroundColor:Colors.black87,
        leading:IconButton(icon:Icon(Icons.favorite) ,
        color: Theme.of(context).accentColor,
         onPressed: () {  },),
         trailing: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {  },
        color: Theme.of(context).accentColor,
         ),
         ),
      ),
    );
  }
}