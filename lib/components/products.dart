import 'package:flutter/material.dart';

//imports from local files
import 'package:perfect_business_services/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Pants",
      "picture": "images/products/pants2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "hills1",
      "picture": "images/products/hills1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "skt",
      "picture": "images/products/skt1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "shoe1",
      "picture": "images/products/shoe1.jpg",
      "old_price": 100,
      "price": 50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
                prod_name: product_list[index]['name'],
                prod_picture: product_list[index]['picture'],
                prod_old_price: product_list[index]['old_price'],
                prod_price: product_list[index]['price'],
              ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: new Text('hero 1'),
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//             here we passing the values of the product to product details           
              builder: (context) => new ProductsDetail(
                products_detail_name: prod_name,
                products_detail_new_price: prod_price,
                products_detail_old_price: prod_old_price,
                products_detail_picture: prod_picture,
              ))),
            child: GridTile(
              footer: Container(
//               white70 is transparent
                color: Colors.white70,
                child: new Row(
                  children: [
                    Expanded(
                      child: new Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),), 
                    ),
                    new Text("\GH₵ $prod_price", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                  ],
                ),
             ),
              child: Image.asset(prod_picture, fit:BoxFit.cover
            ),
          ),
        ),),
    ),
   );
  }
}
