import 'package:class36m/helper/Articalhelper.dart';
import 'package:class36m/helper/categoryhelper.dart';
import 'package:class36m/models/Articles.dart';
import 'package:class36m/models/categorymodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CategoryModel>categorylist = <CategoryModel>[];
  List<Articles> _articleslist=<Articles>[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categorylist=categoryList();
    recivedArticle();

  }
  recivedArticle()async{
    ArticalesHelper articlesHelper=ArticalesHelper();
   await articlesHelper.getArticles();
    _articleslist= articlesHelper.articlesList;

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: Text("Horizontal ScrollListview Newsapi"),
      ),
      body:Column(
        children: [
         Container(
           height: MediaQuery.of(context).size.height*.25,
           child:  ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount:categorylist.length,
               itemBuilder: (context,index){
                 return  Stack(
                   children: [
                     Container(
                       margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                       height: 110,
                       width: 250,
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(10),
                         child: Image.network(
                           categorylist[index].imageUrl,
                           fit: BoxFit.fill,
                         ),
                       ),
                     ),
                     Container(
                       margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10)
                       ),
                       child: Text(
                         categorylist[index].categoryName,
                         textAlign:TextAlign.center,
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 17,
                           fontWeight: FontWeight.w500,

                         ),
                       ),
                     )
                   ],
                 );
               }
           ),
         ),
          SizedBox(height: 12),
          Container(
            height: MediaQuery.of(context).size.height*.60,
            child:  ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount:_articleslist.length,
                itemBuilder: (context,index){
                  return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          height: 300,
                          width: 500,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              _articleslist[index].urlToImage.toString(),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          _articleslist[index].title.toString(),
                          textAlign:TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize:30,

                          ),
                        ),
                        Text(
                          _articleslist[index].description.toString(),
                          textAlign:TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize:15,

                          ),
                        ),
                      ],
                    ),
                  );
                }
            ),
          ),
        ],
      )
    );
  }
}
