import 'package:flutter/cupertino.dart';
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
  bool sort = false;
  int sortindex = 0;

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
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: ExpansionTile(
                      title: Container(
                        height: 30,
                        child: Text(
                          "Sort",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              sort = false;
                             // sortindex = 10;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 12),
                            height: 25,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "All Products",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              sort = true;
                              sortindex = 0;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 12),
                            height: 25,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ranking[0].ranking.toString(),
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              sort = true;
                              sortindex = 1;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 12),
                            height: 25,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ranking[1].ranking.toString(),
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              sort = true;
                              sortindex = 2;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 12),
                            height: 25,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ranking[2].ranking.toString(),
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: _height - 40,
                    width: _width,
                    child: ListView.builder(
                        itemCount: sort
                            ? category[id].products.length -1
                            : ranking[sortindex].products.length,
                        itemBuilder: (context, index) {
                          int indx = ranking[sortindex].products[index].id;
                          if (sort && category[id].products.length < indx - 1) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductsDetail(
                                              products: category[id].products,
                                              id: index,
                                            )));
                              },
                              child: Card(
                                child: Container(
                                  height: 50,
                                  width: _width,
                                  margin: EdgeInsets.only(left: 6, right: 6),
                                  child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(category[id]
                                              .products[index]
                                              .name),
                                          Text("Min Price : " +
                                              category[id]
                                                  .products[index]
                                                  .variants[0]
                                                  .price
                                                  .toString()),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            child: sortindex == 0
                                                ? Text("View Count: " +
                                                    ranking[sortindex]
                                                        .products[index]
                                                        .viewCount
                                                        .toString())
                                                : sortindex == 1
                                                    ? Text("Order Count: " +
                                                        ranking[sortindex]
                                                            .products[index]
                                                            .orderCount
                                                            .toString())
                                                    : Text("Share Count: " +
                                                        ranking[sortindex]
                                                            .products[index]
                                                            .shares
                                                            .toString()),
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                                ),
                              ),
                            );
                          } else if (sort == false) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductsDetail(
                                              products: category[id].products,
                                              id: index,
                                            )));
                              },
                              child: Card(
                                child: Container(
                                  height: 30,
                                  width: _width,
                                  margin: EdgeInsets.only(left: 6, right: 6),
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(category[id].products[index].name),
                                      Text("Min Price : " +
                                          category[id]
                                              .products[index]
                                              .variants[0]
                                              .price
                                              .toString()),
                                    ],
                                  )),
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              height: 0,
                            );
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
