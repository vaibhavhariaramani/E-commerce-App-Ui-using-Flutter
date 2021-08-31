import 'package:app/models.dart/cart.dart';
import 'package:app/models.dart/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cartview.dart';

class ProductDetails extends StatefulWidget {
  final prod_name;
  final prod_picture;
  final prod_price;
  final prod_desc;
  final Product prod_deal;

  ProductDetails({
    this.prod_name,
    this.prod_picture,
    this.prod_price,
    this.prod_desc,
    required this.prod_deal,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    var ccart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text('Vigilante App'),
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
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: [
            Container(
              height: 300.0,
              child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.network(widget.prod_picture),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Expanded(
                child: Text(
                  widget.prod_name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Expanded(
                child: Text(
                  "\₹ ${widget.prod_price}",
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ccart.add(widget.prod_deal);
              },
              child: Text('Add to Cart'),
            ),
            Divider(),
            ListTile(
              title: Text("Product details"),
              subtitle: Text(widget.prod_desc),
            ),
          ],
        ),
      ),
    );
  }
}
