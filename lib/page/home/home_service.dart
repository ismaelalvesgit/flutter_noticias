import 'package:http/http.dart' as http;

class HomeService{

  final String API_URL = "https://newsapi.org/v2/top-headlines?country=pt&apiKey=67db2df48a9d4ca1bb1f0bfa195941ac";

  getData() async{
    return http.get(API_URL);
  }
}