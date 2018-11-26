import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeService {

  bool isPerformingRequest = false;


  int page = 10;

  String perquisa = "asdhaskjdhasjkdhjksdhskj";


  Future<List> getData() async{
    http.Response response;

    response = await http.get("https://newsapi.org/v2/everything?q=$perquisa&sortBy=popularity&apiKey=67db2df48a9d4ca1bb1f0bfa195941ac&language=pt&pageSize=$page");
      var resBody = json.decode(response.body);

      return resBody["articles"];
  }

}