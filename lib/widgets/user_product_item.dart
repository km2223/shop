import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/products.dart';
import 'package:shop/screens/edit_product_screen.dart';
class UserProductItem extends StatelessWidget {
final String id;
final String title;
final String imageUrl;

  const UserProductItem({super.key, required this.id, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
  final snackBar=  ScaffoldMessenger.of(context);
    return ListTile(
      title:Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: (() {
              Navigator.of(context).pushNamed(EditProductScreen.routeName,arguments: id);
              
            }), 
            icon: const Icon(Icons.edit),color:Theme.of(context).primaryColor,),
    
            IconButton(
              onPressed: (()async {
                try{
               await Provider.of<Products>(context,listen: false).deleteProduct(id);

                }
                catch(error){
                snackBar.showSnackBar(const SnackBar(
  content: Text('Deleteing Faild!',textAlign:TextAlign.center,),
  duration: Duration(seconds: 2),
  
)
);

                }
            }),
             icon: const Icon(Icons.delete),color:Theme.of(context).errorColor,)
          ],
        ),
      ),
    );
  }
}