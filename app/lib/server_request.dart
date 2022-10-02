import 'package:http/http.dart' as http;
import 'dart:convert';

/// Class used to handle data fetching from the marketaux API.
class ServerRequest {
  static const String apiKEy = "fae79178d4e941ef825077c3c948ec78";
  static const String fetchUrl =
      "http://api.mediastack.com/v1/news?access_key=fae79178d4e941ef825077c3c948ec78&languages=en&sort=popularity&limit=100&categories=sports";

  /// Fetch the response from the API.
  Future<Response> fetchData() async {
    final response = await http.get(Uri.parse(fetchUrl));

    if (response.statusCode == 200) {
      return Response.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception("Failed to load news article");
    }
  }
}

/// Class representation of a response from the mediastack API.
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
