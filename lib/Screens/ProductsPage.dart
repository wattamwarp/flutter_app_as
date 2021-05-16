import 'package:flutter/material.dart';
import 'package:flutter_app_as/Model/LandingModel.dart';
import 'package:flutter_app_as/Screens/ProductsDetail.dart';

class ProductsPage extends StatefulWidget {
  @override
  LandingModel data;
  int id;

  ProductsPage({this.data, this.id});

  _ProductsPageState createState() => _ProductsPageState(data: data, id: id);
}

class _ProductsPageState extends State<ProductsPage> {
  LandingModel data;

  _ProductsPageState({this.data, this.id});

  int id;
  List<Category> category = [];
  List<Ranking> ranking = [];

  @override
  void initState() {
    super.initState();
    category = data.categories;
    ranking = data.rankings;
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: _height - 25,
                width: _width,
                child: ListView.builder(

                  itemCount: category[id].products.length,
                    itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductsDetail(products: category[id].products ,id: index, )));
                    },
                    child: Card(
                      child: Container(
                        height: 30,
                        width: _width,
                        margin: EdgeInsets.only(left: 6,right: 6),
                        child: Center(child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(category[id].products[index].name),
                            Text("Min Price : "+category[id].products[index].variants[0].price.toString()),
                          ],
                        )),
                      ),
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
