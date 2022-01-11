import 'dart:convert';

import 'package:class36m/models/Articles.dart';
import 'package:http/http.dart' as http;

class ArticalesHelper{

  List<Articles> articlesList= <Articles>[];


  Future getArticles() async{

    var response = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=tesla&from=2021-12-10&sortBy=publishedAt&apiKey=f7346d95478b4ad5bb51654cd55bc27c"));
var jsonData =jsonDecode(response.body);

if (jsonData['status']=='ok'){
  jsonData['articles'].forEach((element){

    Articles articles =
    Articles(element['author']??"",
        element['title']??"",
        element['description']??"",
        element['url']??"",
        element['urlToImage']??"https://c.tenor.com/FBeNVFjn-EkAAAAC/ben-redblock-loading.gif",
        element['publishedAt']??"",
        element['content']??""
    );
   articlesList.add(articles);

  }
  );}
  }
}