import 'package:flutter/material.dart';
import 'package:news/models/articlemodel.dart';

class ArticleCard extends StatelessWidget {
  final ArticleModel article;
  
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.height / 1.1,
        height: MediaQuery.of(context).size.height / 1.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:const Color.fromARGB(106, 255, 255, 255),
          boxShadow: const [
            BoxShadow(
              blurRadius: 40,
              color: Colors.grey,
              offset: Offset(8, 10),
            ),
          ],
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min, 
        children: [
        ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          article.image,
          width: 500,
        ),
              ),
              const SizedBox(height: 10),
              Text(
        article.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
        article.description,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              Text("${article.author}                               ${article.date}",
              style: TextStyle(color: Colors.red),
              ),
            ],
          ),

      ),
    );
  }
}
