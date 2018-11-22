import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List data;

  int page = 10;

  Future<String> _getData() async{
    http.Response response;

      response = await http.get("https://newsapi.org/v2/everything?q=sport&sortBy=popularity&apiKey=67db2df48a9d4ca1bb1f0bfa195941ac&language=pt&pageSize=$page");

      setState(() {
        var resBody = json.decode(response.body);

        data = resBody["articles"];

        print(data);
      });

      return "sucess !!!";
  } 

  @override
  void initState() {
    super.initState();
    setState(() {
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
//        Container(
//          margin: EdgeInsets.only(bottom: 10.0),
//          width: double.infinity,
//          height: 200.0,
//          child: Carousel(
//            showIndicator: true,
//            dotSpacing: 15.0,
//            dotColor: Colors.red,
//            dotIncreaseSize: 5.0,
//            overlayShadow: false,
//            autoplayDuration: Duration(seconds: 10),
//            images: [
//              AssetImage("imagens/slider-01.png"),
//              AssetImage("imagens/slider-02.png"),
//              AssetImage("imagens/slider-03.png"),
//            ],
//          ),
//        ),
        Expanded(child: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text(data[index]["title"],
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 170.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(data[index]["urlToImage"]),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(10.0),
                        child: Text(data[index]["description"],
                          style: TextStyle(
                              fontSize: 15.0
                          ),
                        )
                    ),
                    Container(
                        margin: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.date_range),
                                Text(data[index]["publishedAt"])
                              ],
                            ),
                            Row(
                                children: <Widget>[
                                  Container(
                                    width: 120.0,
                                    height: 30.0,
                                    child: RaisedButton(onPressed: () {},
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20.0)),
                                      color: Colors.red,
                                      child: Text("Leia mais..",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
                                ])
                          ],
                        )
                    )
                  ],
                ),
              );
            })
          )
        ],
      );
    }
}
