import 'package:field_2_fork/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FarmerAddProductScreen extends StatelessWidget {
  const FarmerAddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: green,
      ),
      body: Container(
        // color:
        //     Colors.green, // Set the background color of the top of the screen
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: SafeArea(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    color: green,
                    child: Lottie.asset(
                      "assets/images/farmeraddproduct.json",
                      height: 200.0,
                      width: 400.0,
                      // If you want to preserve aspect ratio
                      //fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        "Add Product",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "Product Name",
                            enabledBorder: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.category),
                            hintText: "Category",
                            enabledBorder: OutlineInputBorder(),
                          ),
                          items: ["Fruits", "Vegetables", "Others"]
                              .map((category) {
                            return DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (value) {
                            // Handle category selection.
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.attach_money),
                            hintText: "Price",
                            enabledBorder: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.shopping_bag),
                            hintText: "Quantity in kgs",
                            enabledBorder: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Implement photo selection logic from local storage.
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.photo),
                              const SizedBox(width: 8),
                              Text("Select Photo"),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Implement Add Product logic.
                        },
                        child: const Text(
                          "Add Product",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
