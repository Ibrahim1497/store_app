import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SelectedItemScreen extends StatelessWidget {
   const SelectedItemScreen({super.key});
  static String id="selected page";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Selected products"),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network("https://lottie.host/1197fed4-09c1-4253-8c82-6676a28ebdc0/gE9HtjP03I.json"),
          Text("no product Selected",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
        ],
      ),)
    );
  }
}
