import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news/Views/article_view.dart';

class SlashScreen extends StatefulWidget {
  const SlashScreen({super.key});

  @override
  State<SlashScreen> createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
    splash: Center(
    child: LottieBuilder.asset("assets/lottie/Animation - 1726682127380.json",
    ),
    ),
     nextScreen: const ArticleScreen(),
     splashIconSize: 400,
     duration: 7500,
     );
  }
}