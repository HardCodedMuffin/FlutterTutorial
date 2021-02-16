import 'package:flutter/material.dart';
import 'Product.dart';
import 'ShoppingList.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.white,
    ),
    home: ShoppingList(
      products: <Product>[
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips'),
        Product(name: 'Milk'),
        Product(name: 'Potato'),
        Product(name: 'Bread'),
      ],
    ),
  ));
}