import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final int quantity;

  Product(this.name, this.price, this.quantity);
}

class FarmerHome extends StatelessWidget {
  const FarmerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
