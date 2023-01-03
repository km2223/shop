import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
    return GridTile(child:Image.network(imageUrl) ,);
  }
}