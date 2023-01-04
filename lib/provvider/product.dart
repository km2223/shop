import 'package:flutter/foundation.dart';

class Product with ChangeNotifier{
  final String title;
  final String id;
  final double price;
  final String description;
  final String imageUrl;
  
  bool isfavorite;
  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.id,
    required this.imageUrl,
     this.isfavorite=false
  });
void taggleFavoritestatus(){
  isfavorite=!isfavorite;
  notifyListeners();
}


}