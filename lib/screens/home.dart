import 'package:app/models.dart/cart.dart';
import 'package:app/models.dart/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cartview.dart';
import 'productlistview.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var ccart = Provider.of<Cart>(context);
    var flagdata = Provider.of<Flags>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vigilante App'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(ccart.count.toString()),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Cartview()));
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // header part of our drawer
            UserAccountsDrawerHeader(
              accountName: const Text('CountryName: Afghanistan'),
              accountEmail: const Text('CountryCode: Af'),
              currentAccountPicture: GestureDetector(
                child: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('Change Country'),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(child: ProductListView()),
    );
  }
}
