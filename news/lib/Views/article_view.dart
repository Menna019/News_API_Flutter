import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news/models/articlemodel.dart';
import 'package:news/services/news_service.dart';
import 'package:news/widgets/articlecard.dart';
import 'webview.dart';  // Import your WebScreen class here

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  List<String> categories = [
    "general",
    "business",
    "sports",
    "entertainment",
    "health",
    "science",
    "technology"
  ];

  List<ArticleModel> articles = [];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.newspaper),
              label: "General",
              icon: Icon(Icons.newspaper_outlined),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.work),
              label: "Business",
              icon: Icon(Icons.work_outline),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.sports_football),
              label: "Sports",
              icon: Icon(Icons.sports_football_outlined),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(FontAwesomeIcons.film),
              label: "Entertainment",
              icon: Icon(FontAwesomeIcons.film),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.health_and_safety),
              label: "Health",
              icon: Icon(Icons.health_and_safety_outlined),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.science),
              label: "Science",
              icon: Icon(Icons.science_outlined),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(FontAwesomeIcons.mobile),
              label: "Technology",
              icon: Icon(FontAwesomeIcons.mobile),
            ),
          ],
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text(
            "News",
            style: TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontFamily: "FjallaOne-Regular.ttf",
            ),
          ),
        ),
        body: FutureBuilder<List<ArticleModel>>(
          future: NewsService().getArticles(category: categories[index]),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  final article = snapshot.data![i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebScreen(url: article.url),
                        ),
                      );
                    },
                    child: ArticleCard(article: article),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
