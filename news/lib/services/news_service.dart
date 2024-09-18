import 'package:dio/dio.dart';
import 'package:news/models/articlemodel.dart';

class NewsService {
  Future<List<ArticleModel>> getArticles({required String category}) async {
    try {
      var response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=1b0ca73ab5f34b1590d46001e904ac81&category=$category",
        
      );

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> art = jsonData['articles'];
      List<ArticleModel> articles = [];

      for (var article in art) {
        ArticleModel model = ArticleModel(
          title: article['title'] ?? "No Title",
          description: article['description'] ?? "No description",
          image: article['urlToImage'] ??
          "https://img.freepik.com/free-vector/404-error-lost-space-concept-illustration_114360-7971.jpg?size=626&ext=jpg&uid=R86730037&ga=GA1.1.993650546.1725801574&semt=ais_hybrid",
          author: article['author'] ?? "No author",
          date: article['publishedAt'] ?? "No date",
          url: article['url']?? "No data",
        );
        articles.add(model);
      }

      return articles;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
