import 'package:flutter/material.dart';

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
    return GridTile(child:Image.network(imageUrl,
    fit:BoxFit.cover,
    ) ,
    footer: GridTileBar(
      title:Text(title,
      textAlign: TextAlign.center,),
      backgroundColor:Colors.black54,
      leading:IconButton(icon:Icon(Icons.favorite) ,
      color: Theme.of(context).accentColor,
       onPressed: () {  },),
       trailing: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {  },
      color: Theme.of(context).accentColor,
       ),
       ),
    );
  }
}