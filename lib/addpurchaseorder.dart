// ignore_for_file: unused_local_variable

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:simsfyp/vendpurchaseorder.dart';
import 'package:simsfyp/purchaseinventory.dart';

class AddPurchase extends StatefulWidget {
  final String name;
  final String quantity;
  final String category;
  final String price;
  final String id;
  const AddPurchase(
      this.name, this.quantity, this.category, this.price, this.id,
      {Key? key})
      : super(key: key);

  @override
  State<AddPurchase> createState() => _AddPurchaseState();
}

class _AddPurchaseState extends State<AddPurchase> {
  final nameController = TextEditingController();
  final quantController = TextEditingController();
  final catController = TextEditingController();
  final priceController = TextEditingController();
  TextEditingController gtController = TextEditingController();
  final dbShowRefrence = FirebaseDatabase.instance.ref('Inventory');
  DatabaseReference ref = FirebaseDatabase.instance.ref('Inventory');
  String? id;
  String purchaseid = DateTime.now().microsecondsSinceEpoch.toString();

  int grandTotal = 0, addQty = 0, originalQty = 0;

  void addpurchase() {
    setState(() {
      String name = nameController.text.toLowerCase();
      String quantity = quantController.text.toLowerCase();
      String price = priceController.text.toLowerCase();
    });
    final dbRefrence = FirebaseDatabase.instance.ref('Purchase Order');
    dbRefrence.child(purchaseid).set({
      'purchaseid': purchaseid,
      'name': nameController.text.toString(),
      'quantity': quantController.text.toString(),
      'price': priceController.text.toString(),
      'grand total': gtController.text.toString(),
    });

    ref.child(id!).update({'id': id, 'quantity': addQty});
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
  String purchase = '';
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
                      builder: (context) => const PurchaseInventory()));
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text("Add Purchase Order"),
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
                  onChanged: (value) => purchase = value,
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
                    purchase = value;
                    grandTotal =
                        int.parse(value) * int.parse(priceController.text);
                    addQty = originalQty + int.parse(quantController.text);
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
                  onChanged: (value) => purchase = value,
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
                      labelText: 'Price', border: OutlineInputBorder()),
                  onChanged: (value) => purchase = value,
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
                  onChanged: (value) => purchase = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter Grand Total';
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
                              builder: (context) => const VendorPurchase(),
                            ),
                          );
                          addpurchase();
                          // ref.child(id!).update({
                          //   'id': id,
                          //   'quantity': quantController.text.toString(),
                          // });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Purchase Order Added')),
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
