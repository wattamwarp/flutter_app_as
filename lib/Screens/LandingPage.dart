import 'package:flutter/material.dart';
import 'package:flutter_app_as/Model/LandingModel.dart';
import 'package:flutter_app_as/Screens/ProductsPage.dart';
import 'package:flutter_app_as/Services/LandingDataService.dart';
import 'package:toast/toast.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  LandingDataService service = new LandingDataService();

  LandingModel data;
  bool isLoading = true;
  List<Category> category = [];
  List<Ranking> ranking = [];

  getData() async {
    setState(() {
      isLoading = true;
    });
    data = await service.getData();
    setState(() {
      category = data.categories;
      ranking = data.rankings;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _height,
          width: _width,
          child: ListView.builder(
            itemCount: category.length,
            itemBuilder: (context, index) {
              int id = index ;
              return InkWell(
                onTap: () {
                  if (category[index].products.length > 0){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsPage(data: data, id: id),
                      ),
                    );
                }else{
                    Toast.show("There No Prodcuts in This ctegory", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM, backgroundColor: Colors.red,textColor: Colors.white);
                  }

                },
                child: Card(
                  child: Container(
                    height: 30,
                    margin: EdgeInsets.only(left: 6,right: 6),
                    child: Center(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text(category[index].name.toString()),
                            Text(category[index].products.length.toString())
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
