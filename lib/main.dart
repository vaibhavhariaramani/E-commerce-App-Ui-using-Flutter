import 'package:app/screens/cartview.dart';
import 'package:app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models.dart/cart.dart';
import 'models.dart/details.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Cart()),
      ChangeNotifierProvider(create: (context) => Flags()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var ccart = Provider.of<Cart>(context);
    return Scaffold(
      body: HomePage(),
    );
  }
}
