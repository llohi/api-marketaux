import 'package:http/http.dart' as http;
import 'dart:convert';

import 'news_article.dart';

/// Class used to handle data fetching from the marketaux API.
class ServerRequest {
  // todo: edit url
  final String URL_MARKET =
      "https://api.marketaux.com/v1/news/all?symbols=AAPL%2CTSLA&filter_entities=true&api_token=zDfQjGP8ZBk6SCxQjM8LghePU2vzvpPYHGmd6Hr2";

  final String URL_SIMILAR =
      "https://api.marketaux.com/v1/news/similar/cc11e3ab-ced0-4a42-9146-e426505e2e67?api_token=zDfQjGP8ZBk6SCxQjM8LghePU2vzvpPYHGmd6Hr2&language=en&published_on=2020-12-01";

  Future<Response> fetchData() async {
    final response = await http.get(Uri.parse(URL_MARKET));

    if (response.statusCode == 200) {
      return Response.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception("Failed to load news article");
    }
  }
}

/// Class representation of a response from the marketaux API.
class Response {
  final List<dynamic> data;

  Response({required this.data});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(data: json['data']);
  }

  List<dynamic> getData() {
    return data;
  }
}
