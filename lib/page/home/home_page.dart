import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_pro/carousel_pro.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ScrollController _scrollController = new ScrollController();

  bool isPerformingRequest = false;

  List data;

  int page = 10;

  String perquisa = "vida";


  Future<String> _getData() async{
    http.Response response;

      response = await http.get("https://newsapi.org/v2/everything?q=$perquisa&sortBy=popularity&apiKey=67db2df48a9d4ca1bb1f0bfa195941ac&language=pt&pageSize=$page");

      setState(() {
        var resBody = json.decode(response.body);

        data = resBody["articles"];
      });

      return "sucess !!!";
  }

  Future<String> _getInfiniteScroll() async{
    if(!isPerformingRequest){
      page += 5;

      setState(() => isPerformingRequest = true);

      http.Response response;

      response = await http.get("https://newsapi.org/v2/everything?q=$perquisa&sortBy=popularity&apiKey=67db2df48a9d4ca1bb1f0bfa195941ac&language=pt&pageSize=$page");
      if (response.body.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom = _scrollController.position.maxScrollExtent - _scrollController.position.pixels;
        if (offsetFromBottom < edge) {
          _scrollController.animateTo(
              _scrollController.offset - (edge -offsetFromBottom),
              duration: new Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }
      }
      setState(() {
        var resBody = json.decode(response.body);

        data = resBody["articles"];
        isPerformingRequest = false;
      });
    }
    return "sucess !!!";
  }

  Future<Null> _refresList() async{
    http.Response response;

    response = await http.get("https://newsapi.org/v2/everything?q=$perquisa&sortBy=popularity&apiKey=67db2df48a9d4ca1bb1f0bfa195941ac&language=pt&pageSize=$page");

    setState(() {
      var resBody = json.decode(response.body);
      data = resBody["articles"];
    });
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _getData();
    });
    _scrollController.addListener( (){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _getInfiniteScroll();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(child: CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverAppBar(
          floating: false,
          pinned: true,
          expandedHeight: 170.0,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: (){
              showSearch(context: context, delegate: DataSearch());
            })
          ],
          flexibleSpace: FlexibleSpaceBar(
            title: InkWell(
              onTap: (){
                _scrollController.animateTo(
                  0.0,
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 300),
                );
              },
              child: Text("Ultimas Noicias"),
            ),
            centerTitle: true,
            background: Carousel(
              autoplay: false,
              overlayShadow: false,
              noRadiusForIndicator: false,
              showIndicator: false,
              animationCurve: Curves.easeIn,
              images: [
                AssetImage("imagens/slider-01.png"),
                AssetImage("imagens/slider-02.png"),
                AssetImage("imagens/slider-03.png"),
              ],
            )
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index){
            if(data == []){
              return Center(child: Text("Erro ao carregar os dados"),);
            }else if( index == data.length){
              return _buildProgressIndicator();
            }else {
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
                    ),
                  ],
                ),
              );
            }
          },
          childCount: data == null ? 0 : data.length+1
          ),
        )
      ],
    ), onRefresh: _refresList);
  }
}

class DataSearch extends SearchDelegate<String>{

  final Cities = [

  ];

  final recentesCities = [
    "sport",
    "vida",
    "entreterimento"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(icon: Icon(Icons.clear), onPressed: (){
      Navigator.pop(context);
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
    onPressed: (){

    });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    final suggestionlist = query.isEmpty ? recentesCities : Cities;

    return ListView.builder(
      itemCount: suggestionlist.length,
      itemBuilder: (context, index)=> ListTile(
        leading: Icon(Icons.search),
        title: Text(suggestionlist[index]),
      ),
    );
  }

}
