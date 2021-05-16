import 'package:flutter_app_as/Model/LandingModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LandingDataService{

  static var client= new http.Client();

  Future getData() async {
    Uri url = Uri.parse(
        "https://stark-spire-93433.herokuapp.com/json");

   var response =await client.get(url);

   if(response.statusCode == 200){
     var jsonData= json.decode(response.body);
     LandingModel data = LandingModel.fromJson(jsonData);
     print("the ranking is");
     print(data.rankings.length.toString());
     print(data.rankings[0].products.toString());
     print(data.rankings[0].products[0].id.toString());
     return data;
   }else{
     return null;
   }


  }


}