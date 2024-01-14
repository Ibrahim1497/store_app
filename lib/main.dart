import 'package:flutter/material.dart';
import 'package:store_app/screens/SelectedItemsScreen.dart';
import 'package:store_app/screens/addProduct.dart';
import 'package:store_app/screens/homeScreen.dart';
import 'package:store_app/screens/splashScreen.dart';
import 'package:store_app/screens/updateProduct.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
              foregroundColor: Colors.black,
              color: Colors.white, elevation: 0)),
      routes: {
        SplashScreen.id:(context)=>SplashScreen(),
        HomeScreen.id:(context)=>HomeScreen(),
        SelectedItemScreen.id:(context)=>SelectedItemScreen(),
        UpdateProductScreen.id:(context)=>UpdateProductScreen(),
        AddProductScreen.id:(context)=>AddProductScreen()
      },
      initialRoute: SplashScreen.id,

    );
  }
}
