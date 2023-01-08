import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/cart.dart';
class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;

      CartItem({
      
     required this.productId,
    required this.id,
    required this.price,
    required this.quantity,
    required this.title
   });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(color:Theme.of(context).errorColor,
      child: Icon(Icons.delete,
      color: Colors.white,
      size: 40,
      
      ),
      alignment: Alignment.centerRight,
        margin:EdgeInsets.symmetric(horizontal: 15,vertical: 4),
        padding: EdgeInsets.only(right: 20),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context,listen: false).removeItem(productId);
      },
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
           builder: ((context) => AlertDialog(
            title: Text('Are you sure?'),
            content:Text('Do you want to remove the item from the cart ') ,
                 actions: [
        TextButton(
          child: Text("Yes"),
          onPressed: () {
          Navigator.of(context).pop(true);
        },),
                TextButton(
                  child: Text("No"),
                  onPressed: () {
          Navigator.of(context).pop(false);
          
        },),

      ],
            )
            
            )
            );
      },
      child: Card(
        margin:EdgeInsets.symmetric(horizontal: 15,vertical: 4),
        child: Padding(padding: EdgeInsets.all(8),
        child: ListTile(
          title: Text(title),
          subtitle: Text('Total: \$${(price*quantity)}'),
          trailing: Text('$quantity x'),
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(child: Text('\$$price')),
            ),
            
          ),
        ),
      
        ),
    
        
      ),
    );
  }
}