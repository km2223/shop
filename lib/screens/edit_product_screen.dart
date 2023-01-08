import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  void updateImageUrl(){
    if(! _imageUrlFocesNode.hasFocus){
      setState(() {
        
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Product'),),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(child: ListView(children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Title'),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_priceFocus); 
            },
          ),
                    TextFormField(
            decoration: const InputDecoration(labelText: 'price'),
            textInputAction: TextInputAction.next,
            keyboardType:TextInputType.number,
            focusNode: _priceFocus,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(_descriptionFoucs); 
              
            },
            
          ),
           TextFormField(
            decoration: const InputDecoration(labelText: 'Description'),
            keyboardType:TextInputType.multiline,
            maxLines: 3,
            focusNode: _descriptionFoucs,
           
          ),
          Row(
          
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(top: 8,right: 10),
              decoration:BoxDecoration(border:Border.all(width: 1,color:Colors.grey)),
              child: _imageUrlController.text.isEmpty?Text('Eter Url'):FittedBox(child:Image.network(_imageUrlController.text,fit:BoxFit.cover,),),
            ),
            Expanded(
              child: TextFormField(decoration:const InputDecoration(labelText: 'ImageUrl'),
              keyboardType:TextInputType.url,
              textInputAction:TextInputAction.done,
              controller:_imageUrlController,
              focusNode: _imageUrlFocesNode,
              ),
            )
          ],)
        ],)),
      ),
    );
  }
}