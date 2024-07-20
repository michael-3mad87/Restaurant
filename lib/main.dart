

import 'package:flutter/material.dart';
import 'package:food/models/shop_model.dart';
import 'package:food/pages/HomePage.dart';
import 'package:food/pages/StarterPage.dart';
import 'package:food/pages/cart_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Roboto'),
        home:  StarterPage(),
        routes: {
          'StarterPage': (context) => StarterPage(),
          'HomePage': (context) => HomePage(),
          'CartPage':(context)=> CartPage() ,
        });
  }
}
