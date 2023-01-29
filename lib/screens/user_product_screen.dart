import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/products.dart';
import 'package:shop/screens/edit_product_screen.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/user_product_item.dart';

class UserProduct extends StatelessWidget {
static const routeName='/user_product';
Future<void>_refreshProduct(BuildContext context)async {
  await Provider.of<Products>(context,listen: false).fetchAndSetProduct(true);

}
  @override
  Widget build(BuildContext context) {
    //final productdata= Provider.of<Products>(context);
    return Scaffold(
      
      appBar:AppBar(title:const Text('Your Product'),
      
      actions: [
        
        IconButton(onPressed: (() {
          Navigator.of(context).pushNamed(EditProductScreen.routeName);
        }), icon: const Icon(Icons.add))
      ],
      
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: _refreshProduct(context),
        builder: (BuildContext context,
         AsyncSnapshot<dynamic> snapshot)=> snapshot.connectionState==ConnectionState.waiting?
         const Center(child: CircularProgressIndicator(),):
         RefreshIndicator(
          onRefresh: () => _refreshProduct(context),
          
          child: Consumer<Products>(
            builder: (BuildContext context, productdata, Widget? child) {
               return Padding(padding: const EdgeInsets.all(10),
            child: ListView.builder(itemBuilder: ((_, index) => Column(
              children: [
                UserProductItem(id: productdata.items[index].id, title: productdata.items[index].title, imageUrl: productdata.items[index].imageUrl),
                const Divider()
              ],
            )
            ),itemCount:productdata.items.length),
            );
              },
           
          ),
        ),
      ),
      
    );
  }
}