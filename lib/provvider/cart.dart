import 'package:flutter/material.dart';

class CartItem{
  final String id;
  final String title;
  final double price;
  final int quantity;
  CartItem({
    required this.id,
    required this.price,
    required this.title,
    required this.quantity,

  });

}
class Cart with ChangeNotifier{
   Map<String,CartItem> _items={};
  Map<String,CartItem> get items{
    return{..._items};
  }
  int get itemCount{
    return _items== null? 0: _items.length;
  }
void addItem(String productId,double price,String title){
  if (_items.containsKey(productId)) {
    _items.update(productId, (existingCartItem) => CartItem(id: existingCartItem.id, price:existingCartItem.price, title:existingCartItem. title, quantity: existingCartItem.quantity+1));
  } else {
    _items.putIfAbsent(productId, () => CartItem(id: DateTime.now().toString(), price: price, quantity: 1, title: title));
    
  }
}

}