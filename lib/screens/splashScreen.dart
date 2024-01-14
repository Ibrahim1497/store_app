import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/material.dart';
import 'package:store_app/screens/homeScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String id = "splash screen";
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: Colors.black26,
        splash: Center(
            child: RippleAnimation(
                color: Colors.orange,
                ripplesCount: 5,
                minRadius: 150,
                size: const Size(150, 150),
                child: Center(
                  child: Icon(
                    Icons.shopping_cart,
                    size: 100,
                    color: Colors.deepOrange,
                  ),
                ))),
        nextScreen: HomeScreen());
  }
}
