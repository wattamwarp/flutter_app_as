import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app_as/Model/LandingModel.dart';

class ProductsDetail extends StatefulWidget {
  List<CategoryProduct> products;
  int id;

  ProductsDetail({this.products, this.id});

  @override
  _ProductsDetailState createState() =>
      _ProductsDetailState(products: products, id: id);
}

class _ProductsDetailState extends State<ProductsDetail> {
  List<CategoryProduct> products;
  int id;

  _ProductsDetailState({this.products, this.id});

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(8),
          height: _height,
          child: Column(
            children: [
              Container(
                height: 40,
                child: Text(products[id].name.toString()),
              ),
              Container(
                height: 40,
                child: Text(products[id].dateAdded.toString().substring(0,10)),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tax Name: "+products[id].tax.name.toString()),
                  Text("Percentage: "+products[id].tax.value.toString())
                  ],
                ),
              ),
              Container(
                height:  120,
                child: ListView.builder(
                    itemCount: products[id].variants.length ,
                    itemBuilder: (context, index) {
                      //print("the index is"+index.toString());
                  return Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(products[id].variants[index].color.toString()),
                        Text(products[id].variants[index].size.toString()),
                        Text(products[id].variants[index].price.toString()),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
