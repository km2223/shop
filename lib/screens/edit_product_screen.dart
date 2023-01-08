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

  @override
  void dispose() {
    super.dispose();
    _descriptionFoucs.dispose();
    _priceFocus.dispose();
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
        ],)),
      ),
    );
  }
}