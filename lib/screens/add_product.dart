import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Color  white = Colors.white;
  Color  black = Colors.black;
  Color  grey = Colors.grey;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: white,
        leading: Icon(Icons.close,color: black,),
        title: Text("add product", style: TextStyle(color: black),),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      borderSide: BorderSide(color: grey.withOpacity(0.5), width: 2.5),
                      onPressed: (){},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14, 40, 14, 40 ),
                        child: new Icon(Icons.add, color:grey,),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      borderSide: BorderSide(color: grey.withOpacity(0.5), width: 2.5),
                      onPressed: (){},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14, 40, 14, 40 ),
                        child: new Icon(Icons.add, color:grey,),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      borderSide: BorderSide(color: grey.withOpacity(0.5), width: 2.5),
                      onPressed: (){},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14, 40, 14, 40 ),
                        child: new Icon(Icons.add, color:grey,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: productNameController,
              decoration: InputDecoration(
                hintText: 'Product name'
              ),
              validator: (value){
                if(value.isEmpty){
                  return 'you must enter the product name';
                }else if(value.length > 10){
                  return 'Product name cant have more than 10 letters';
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
