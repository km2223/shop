import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/product.dart';
import 'package:shop/provider/products.dart';
class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});
  static const routeName='/edit-product';

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocus=FocusNode();
  final _descriptionFoucs=FocusNode();
  final _imageUrlController=TextEditingController();
  final _imageUrlFocesNode=FocusNode();
  final _form=GlobalKey<FormState>();
  var _EditProduct=Product(title: '', description: '', price: 0, id: null.toString(), imageUrl: '');

  @override
  void dispose() {
    super.dispose();
    _imageUrlFocesNode.removeListener(updateImageUrl);
    _descriptionFoucs.dispose();
    _priceFocus.dispose();
    _imageUrlController.dispose();
    _imageUrlFocesNode.dispose();
  }
  @override
  void initState() {
    _imageUrlFocesNode.addListener(updateImageUrl);
    super.initState();
  }
     void _saveForm(){
      final isvalde= _form.currentState!.validate();
      if(!isvalde)
      {return;}
     _form.currentState!.save();
      Provider.of<Products>(context,listen: false).addProduct(_EditProduct);
      Navigator.pop(context);

 

    }
  void updateImageUrl(){
    if(! _imageUrlFocesNode.hasFocus){
      if(_imageUrlController.text.isEmpty
      ||!_imageUrlController.text.startsWith('http')
      &&!_imageUrlController.text.startsWith('https')
      ||!_imageUrlController.text.endsWith('jpg')
      ||!_imageUrlController.text.endsWith('jpeg')||
      !_imageUrlController.text.endsWith('png'))
      {
        return ;
      }
      setState(() {
        
      });
    }
 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Product'),
      actions: [
        IconButton(onPressed:_saveForm , icon:const Icon(Icons.save))

      ],),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _form,
          child: ListView(children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Title'),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_priceFocus); 
            
            },
                        validator: (value) {
              if(value!.isEmpty){
                return 'Please Provide a value ';
              }
              return null;
              
            },
            onSaved: (newValue) {
              _EditProduct=Product(title:newValue.toString() , description: _EditProduct.description, price: _EditProduct.price, id: null.toString(), imageUrl: _EditProduct.imageUrl);
            },

          ),
                    TextFormField(
            decoration: const InputDecoration(labelText: 'price'),
            textInputAction: TextInputAction.next,
            keyboardType:TextInputType.number,
            focusNode: _priceFocus,
            validator: (value) {
              if(value!.isEmpty){
                return 'Please Enter The Price.';
              }
              if(double.tryParse(value)==null){
                return 'Please Enter a Valid number.';
              }
              if(double.tryParse(value)!<= 0){
                return 'Please Enter Number greater than Zero. ';
              }
              return null;
            },
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_descriptionFoucs);
            },
                onSaved: (newValue) {
              _EditProduct=Product(title:_EditProduct.title , description: _EditProduct.description, price: double.parse(newValue.toString()), id: null.toString(), imageUrl: _EditProduct.imageUrl);
            
            },
            
          ),
           TextFormField(
            decoration: const InputDecoration(labelText: 'Description'),
            keyboardType:TextInputType.multiline,
            maxLines: 3,
            focusNode: _descriptionFoucs,
            validator: (value) {
              if(value!.isEmpty){
                return 'Please Enter The Description';

              }
              if(value.length<10){
                return 'Please Enter More than 10 characters';
              }
            },
              onSaved: (newValue) {
              _EditProduct=Product(title:_EditProduct.title , description: newValue.toString(), price: _EditProduct.price, id: null.toString(), imageUrl: _EditProduct.imageUrl);
            },
           
          ),
          Row(
          
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(top: 8,right: 10),
              decoration:BoxDecoration(border:Border.all(width: 1,color:Colors.grey)),
              child: _imageUrlController.text.isEmpty?Text('Enter Url'):FittedBox(child:Image.network(_imageUrlController.text,fit:BoxFit.cover,),),
            ),
            Expanded(
              child: TextFormField(decoration:const InputDecoration(labelText: 'ImageUrl'),
              keyboardType:TextInputType.url,
              textInputAction:TextInputAction.done,
              controller:_imageUrlController,
              focusNode: _imageUrlFocesNode,
              
                            onSaved: (newValue) {
              _EditProduct=Product(title:_EditProduct.title , description:_EditProduct.description, price: _EditProduct.price, id: null.toString(), imageUrl: newValue.toString());
            },
              onFieldSubmitted:(value) {
                _saveForm();
              }, 
              ),
            )
          ],)
        ],)),
      ),
    );
  }
}