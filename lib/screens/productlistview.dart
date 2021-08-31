import 'dart:convert';

import 'package:app/models.dart/cart.dart';
import 'package:app/models.dart/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'product_details.dart';

// ignore: use_key_in_widget_constructors
class ProductListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ccart = Provider.of<Cart>(context);
    return FutureBuilder<List<Product>>(
      future: _getProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product>? data = snapshot.data;
          return _productListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Future<List<Product>> _getProducts() async {
    const productURL = 'https://fakestoreapi.com/products';
    final response = await http.get(Uri.parse(productURL));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products from fake API');
    }
  }

  GridView _productListView(data) {
    return GridView.builder(
      itemCount: data.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        var ccart = Provider.of<Cart>(context);
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Single_prod(
            prod_name: data[index].title,
            prod_picture: data[index].img,
            prod_price: data[index].price,
            prod_desc: data[index].desc,
            prod_deal: data[index],
          ),
        );
      },
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_price;
  final prod_desc;
  final Product prod_deal;

  Single_prod(
      {this.prod_name,
      this.prod_picture,
      this.prod_price,
      this.prod_desc,
      required this.prod_deal});
  @override
  Widget build(BuildContext context) {
    var ccart = Provider.of<Cart>(context);
    return Card(
      child: Hero(
        tag: Text("hero 1"),
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              // here we are product details in constructor
              builder: (context) => ProductDetails(
                prod_name: this.prod_name,
                prod_picture: this.prod_picture,
                prod_price: this.prod_price,
                prod_desc: this.prod_desc,
                prod_deal: this.prod_deal,
              ),
            )),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        prod_name,
                        maxLines: 1,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\₹ $prod_price",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              child: Image.network(
                prod_picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
