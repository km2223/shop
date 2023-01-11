import 'package:flutter/material.dart';
import 'package:shop/provider/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Products with ChangeNotifier{
   final List<Product>_items=[
        Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  List<Product>get items{

    return [..._items];
    
  }
  List <Product>get favoriteItems{
    return _items.where((prodItem) => prodItem.isfavorite).toList();
  }
 Product findById(String id){
  return _items.firstWhere((prod) => prod.id==id);
 }
 Future< void >addProduct(Product prod) async {
  final  url= Uri.parse('https://shopapp-99ffc-default-rtdb.firebaseio.com/Products.json');
 return await http.post(url,body:json.encode({
    'title':prod.title,
    'description':prod.description,
    'price':prod.price,
    'id':prod.id,
    'imageUrl':prod.imageUrl,
    'isfavorite':prod.isfavorite
  })).then((value) {
  final newProduct=Product(
    title:prod.title,
    description: prod.description, 
    price:prod. price,
    id:json.decode(value.body)['name'],
    imageUrl:prod. imageUrl);
    _items.add(newProduct);
  notifyListeners();});
  
 }
 void updateProduct(String id,Product newProduct){
final productIndx=_items.indexWhere((element) => element.id==id);
if (productIndx>=0) {
  _items[productIndx]=newProduct;
  notifyListeners();
  
} else {
  print("object");
}
 }
 void deletProduct(String id){
  _items.removeWhere((element) => element.id==id);
  notifyListeners();
 }
}