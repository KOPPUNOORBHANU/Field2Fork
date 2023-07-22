import 'package:flutter/material.dart';

class FarmerMyProductsScreen extends StatefulWidget {
  const FarmerMyProductsScreen({super.key});

  @override
  State<FarmerMyProductsScreen> createState() => _FarmerMyProductsScreenState();
}

class _FarmerMyProductsScreenState extends State<FarmerMyProductsScreen> {
  String selectedCategory = 'All'; // Initially set to 'All' category

  final List<Product> allProducts = [
    Product('Fruits', 'Apple', 2.99, '5 kg', "assets/images/apples.png"),
    Product('Fruits', 'Banana', 1.49, '3 kg', "assets/images/bananas.png"),
    Product('Fruits', 'Orange', 2.25, '4 kg', 'assets/images/oranges.png'),
    Product('Vegetables', 'Carrot', 1.99, '2 kg', 'assets/images/carrots.jpeg'),
    Product('Vegetables', 'Tomato', 2.49, '1 kg', 'assets/images/tomatos.jpeg'),
    Product(
        'Vegetables', 'Broccoli', 3.99, '1.5 kg', 'assets/images/broccoli.png'),
    // Add more products here...
  ];

  List<Product> filteredProducts() {
    if (selectedCategory == 'All') {
      return allProducts;
    } else {
      return allProducts
          .where((product) => product.category == selectedCategory)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  value: selectedCategory,
                  items: [
                    DropdownMenuItem(
                      value: 'All',
                      child: Text('All'),
                    ),
                    DropdownMenuItem(
                      value: 'Fruits',
                      child: Text('Fruits'),
                    ),
                    DropdownMenuItem(
                      value: 'Vegetables',
                      child: Text('Vegetables'),
                    ),
                    // Add more categories here...
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts().length,
              itemBuilder: (context, index) {
                return ProductCard(filteredProducts()[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String category;
  final String name;
  final double price;
  final String quantity;
  final String imageUrl;

  Product(this.category, this.name, this.price, this.quantity, this.imageUrl);
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(
          product.imageUrl,
          width: 80,
          height: 80,
        ),
        title: Text(product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price: \$${product.price.toStringAsFixed(2)}'),
            Text('Quantity: ${product.quantity}'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                // Handle edit action.
              },
              icon: Icon(Icons.edit, color: Colors.green),
            ),
            IconButton(
              onPressed: () {
                // Handle delete action.
              },
              icon: Icon(Icons.delete, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
