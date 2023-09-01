// ignore_for_file: unused_local_variable

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:simsfyp/inventory.dart';

class AddInventory extends StatefulWidget {
  const AddInventory({Key? key}) : super(key: key);

  @override
  State<AddInventory> createState() => _AddInventoryState();
}

class _AddInventoryState extends State<AddInventory> {
  final nameController = TextEditingController();
  final quantController = TextEditingController();
  final catController = TextEditingController();
  final priceController = TextEditingController();
  String id = DateTime.now().microsecondsSinceEpoch.toString();

  void addinventory() {
    setState(() {
      String name = nameController.text.toLowerCase();
      String quantity = quantController.text.toLowerCase();
      String category = catController.text.toLowerCase();
      String price = priceController.text.toLowerCase();
    });
    final dbRefrence = FirebaseDatabase.instance.ref('Inventory');
    dbRefrence.child(id).set({
      'id': id,
      'name': nameController.text.toString(),
      'quantity': quantController.text.toString(),
      'category': catController.text.toString(),
      'price': priceController.text.toString(),
    });
  }

  final _formKey = GlobalKey<FormState>();
  String location = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Inventory"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Product Name
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter Product Name';
                    }
                    // Return null if the entered email is valid
                    return null;
                  },
                  onChanged: (value) => location = value,
                ),

                const SizedBox(
                  height: 15,
                ),

                /// Quantity
                TextFormField(
                  controller: quantController,
                  decoration: const InputDecoration(
                      labelText: 'Quantity', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter Product Quantity';
                    }
                    // Return null if the entered email is valid
                    return null;
                  },
                  onChanged: (value) => location = value,
                ),
                const SizedBox(
                  height: 15,
                ),

                /// Category
                TextFormField(
                  controller: catController,
                  decoration: const InputDecoration(
                      labelText: 'Product Category',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter Product Category';
                    }
                    // Return null if the entered email is valid
                    return null;
                  },
                  onChanged: (value) => location = value,
                ),
                const SizedBox(
                  height: 15,
                ),

                /// Category
                TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(
                      labelText: 'Product Price', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter Product Price';
                    }
                    // Return null if the entered email is valid
                    return null;
                  },
                  onChanged: (value) => location = value,
                ),

                const SizedBox(
                  height: 15,
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          addinventory();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Inventory(),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Stock Added Successfully')),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
