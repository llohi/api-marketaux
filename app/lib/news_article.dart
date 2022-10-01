class NewsArticle {
  final String title;
  final String description;
  final String imageURL;

  const NewsArticle({
    required this.title,
    required this.description,
    required this.imageURL,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: (json["data"][0] as Map<String, dynamic>)["title"],
      description: (json["data"][0] as Map<String, dynamic>)["description"],
      imageURL: (json["data"][0] as Map<String, dynamic>)["image_url"],
    );
  }
}
