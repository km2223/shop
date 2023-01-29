
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop/provider/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/http_exception.dart';
class Products with ChangeNotifier{
    List<Product>_items=[
      /*    Product(
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
    ),  */
  ];
   String? authToken;
   String ?userId;
  Products(this.authToken,this._items,this.userId);

  List<Product>get items{

    return [..._items];
    
  }
  List <Product>get favoriteItems{
    return _items.where((prodItem) => prodItem.isfavorite).toList();
  }
 Product findById(String id){
  return _items.firstWhere((prod) => prod.id==id);
 } 


Future<void>fetchAndSetProduct ([bool filterByUser =false]) async{
  final filterString=filterByUser?'orderBy="creatorId"&equalTo=$userId':'';
  //final url = Uri.https('shopapp-99ffc-default-rtdb.firebaseio.com', '/Products.json', {'auth' : '$authToken'});
   var url =Uri.parse('https://shopapp-99ffc-default-rtdb.firebaseio.com/Products.json?auth=$authToken&$filterString');
    
//try{
final response= await http.get(url);

//Map<String, dynamic> extractData = json.decode(response.body) as Map<String, dynamic>;
final extractData=json.decode(response.body) as Map<String,dynamic>;

if (extractData==null){return;}
     url =Uri.parse('https://shopapp-99ffc-default-rtdb.firebaseio.com/userFavorites/$userId.json?auth=$authToken');

final favoriteResponse= await http.get(url);
final favoriteData=json.decode(favoriteResponse.body) ;
final List<Product>loadedProduct=[];
extractData.forEach((prodId, prodData) { 
  loadedProduct.add(Product(
      id: prodId,
    title: prodData["title"],
     description: prodData['description'],
      price: prodData['price'], 
       imageUrl: prodData['imageUrl'],
       isfavorite: favoriteData == null || favoriteData[prodId] == null
              ? false
              : favoriteData[prodId]['isFavorite'] ?? false,
       )
       );
});
_items=loadedProduct;
notifyListeners();
//}
/*  catch(error){
  
 //HttpException(error.toString());
 rethrow;

}  */
}

  Future<void> addProduct(Product product) async {
    final url =Uri.parse('https://shopapp-99ffc-default-rtdb.firebaseio.com/Products.json?auth=$authToken');
    try{
    final response= await http .post(url,
      body: json.encode({
        'title': product.title,
        'description': product.description,
        'imageUrl': product.imageUrl,
        'price': product.price,
        'creatorId':userId
      }),
    );
      final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    }
    catch (error){
      throw (error);
    }
    
    
    
  /*   .catchError((error) {
      print(error);
      throw error;
    }); */
  }


 /* Future<void> addProduct(Product product)  {
    final url =  Uri.parse('https://shopapp-99ffc-default-rtdb.firebaseio.com/Products');
    return  http
        .post(
      url,
      body: json.encode({
        'title': product.title,
        'description': product.description,
        'imageUrl': product.imageUrl,
        'price': product.price,
        'isFavorite': product.isfavorite,
      }),
    )
        .then((response) {
      final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    });
  }
 
 .catchError((error) {
      print(error);
      throw error;
    })
 Future< void >addProduct(Product prod)  {
  final  url= Uri.parse('https://shopapp-99ffc-default-rtdb.firebaseio.com/Products');
 return  http.post(url,body:json.encode({
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
  notifyListeners();}).catchError((error){
    print(error);
    throw error;
  });
  
 }*/
 Future< void> updateProduct(String id,Product newProduct) async{
final productIndx=_items.indexWhere((element) => element.id==id);

if (productIndx>=0) {
    final url =Uri.parse('https://shopapp-99ffc-default-rtdb.firebaseio.com/Products/$id.json?auth=$authToken');

   await http
        .patch(
      url,
      body: json.encode({
        'title': newProduct.title,
        'description': newProduct.description,
        'imageUrl': newProduct.imageUrl,
        'price': newProduct.price,
        
      }),
    );
  _items[productIndx]=newProduct;
  notifyListeners();
  
} else {
  print("object");
}
 }
  Future<void> deleteProduct(String id) async {
    final url =Uri.parse('https://shopapp-99ffc-default-rtdb.firebaseio.com/Products/$id.json?auth=$authToken');
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    Product? existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
  }
}