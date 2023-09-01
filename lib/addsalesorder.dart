// ignore_for_file: unused_local_variable

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:simsfyp/custsalesorder.dart';
import 'package:simsfyp/custdashboard.dart';
import 'package:simsfyp/custsalesorder.dart';

class AddSale extends StatefulWidget {
  final String name;
  final String quantity;
  final String category;
  final String price;
  final String id;
  const AddSale(this.name, this.quantity, this.category, this.price, this.id,
      {Key? key})
      : super(key: key);

  @override
  State<AddSale> createState() => _AddSaleState();
}

class _AddSaleState extends State<AddSale> {
  final nameController = TextEditingController();
  final quantController = TextEditingController();
  final catController = TextEditingController();
  final priceController = TextEditingController();
  TextEditingController gtController = TextEditingController();
  final dbShowRefrence = FirebaseDatabase.instance.ref('Inventory');
  DatabaseReference ref = FirebaseDatabase.instance.ref('Inventory');
  String? id;
  String saleid = DateTime.now().microsecondsSinceEpoch.toString();

  int grandTotal = 0, remQty = 0, originalQty = 0;

  void addsale() {
    setState(() {
      String name = nameController.text.toLowerCase();
      String quantity = quantController.text.toLowerCase();
      String price = priceController.text.toLowerCase();
    });
    final dbRefrence = FirebaseDatabase.instance.ref('Sales Order');
    dbRefrence.child(saleid).set({
      'saleid': saleid,
      'name': nameController.text.toString(),
      'quantity': quantController.text.toString(),
      'price': priceController.text.toString(),
      'grand total': gtController.text.toString(),
      'inv_id': id
    });

    ref.child(id!).update({'id': id, 'quantity': remQty});
  }

  @override
  void initState() {
    nameController.text = widget.name;
    quantController.text = widget.quantity;
    catController.text = widget.category;
    priceController.text = widget.price;
    originalQty = int.parse(widget.quantity);

    id = widget.id;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  String sale = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustomerSale()));
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text("Add Sales Order"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// name
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  enabled: false,
                  controller: nameController,
                  decoration: const InputDecoration(
                      labelText: 'Product Name', border: OutlineInputBorder()),
                  onChanged: (value) => sale = value,
                ),

                const SizedBox(
                  height: 15,
                ),

                /// quantity
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: quantController,
                  decoration: const InputDecoration(
                      labelText: 'Quantity', border: OutlineInputBorder()),
                  onChanged: (value) {
                    sale = value;
                    grandTotal =
                        int.parse(value) * int.parse(priceController.text);
                    remQty = originalQty - int.parse(quantController.text);
                    gtController.text = grandTotal.toString();
                  },
                ),
                const SizedBox(
                  height: 15,
                ),

                /// category
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  enabled: false,
                  controller: catController,
                  decoration: const InputDecoration(
                      labelText: 'Category', border: OutlineInputBorder()),
                  onChanged: (value) => sale = value,
                ),
                const SizedBox(
                  height: 15,
                ),

                /// price
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  enabled: false,
                  controller: priceController,
                  decoration: const InputDecoration(
                      labelText: 'Price (\$)', border: OutlineInputBorder()),
                  onChanged: (value) => sale = value,
                ),
                const SizedBox(
                  height: 15,
                ),

                /// grand total
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  enabled: false,
                  controller: gtController,
                  decoration: const InputDecoration(
                      labelText: 'Grand Total (\$)',
                      border: OutlineInputBorder()),
                  onChanged: (value) => sale = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CustomerSale(),
                            ),
                          );
                          addsale();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Sales Order Added')),
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
