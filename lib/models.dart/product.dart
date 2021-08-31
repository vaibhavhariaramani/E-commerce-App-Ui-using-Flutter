class Product {
  final dynamic id;
  final dynamic title;
  final dynamic price;
  final dynamic desc;
  final dynamic cat; //category
  final dynamic img;

  Product({this.id, this.title, this.price, this.desc, this.cat, this.img});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        desc: json['description'],
        cat: json['category'],
        img: json['image']);
  }
}
