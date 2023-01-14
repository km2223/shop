import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

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
  void _setFavValue(bool newState){
    isfavorite=newState;
notifyListeners();
  }
 Future< void >taggleFavoritestatus()async{
  final oldState=isfavorite;
    isfavorite=!isfavorite;
  notifyListeners();
    final url =Uri.parse('https://shopapp-99ffc-default-rtdb.firebaseio.com/Products/$id.json');

  try{
    final response= await http.patch(url,body:json.encode({
      'isFavorite':isfavorite
    }));
    if(response.statusCode>=400){
_setFavValue(oldState);
    }
  }
  catch(error){
_setFavValue(oldState);
  }

}


}