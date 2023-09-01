// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:simsfyp/custsalesorder.dart';

class AddSaleReturn extends StatefulWidget {
  final String name;
  final String quantity;
  final String price;
  final String grandTotal;
  final String saleid;
  final String inv_id;

  const AddSaleReturn(this.name, this.quantity, this.price, this.grandTotal,
      this.saleid, this.inv_id,
      {Key? key})
      : super(key: key);

  @override
  State<AddSaleReturn> createState() => _AddSaleReturnState();
}

class _AddSaleReturnState extends State<AddSaleReturn> {
  final nameController = TextEditingController();
  final quantController = TextEditingController();
  final priceController = TextEditingController();
  final gtController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  final dbShowRefrence = FirebaseDatabase.instance.ref('Sales Order');
  DatabaseReference ref = FirebaseDatabase.instance.ref('Sales Order');
  final dbRef = FirebaseDatabase.instance.ref('Inventory');
  DatabaseReference refr = FirebaseDatabase.instance.ref().child('Inventory');
  String? id;
  String? saleid;
  String salereturnid = DateTime.now().microsecondsSinceEpoch.toString();

  int addQty = 0, originalQty = 0;
  int chk = 0;

  Future<void> addreturn() async {
    setState(() {
      String name = nameController.text.toLowerCase();
      String quantity = quantController.text.toLowerCase();
      String price = priceController.text.toLowerCase();
    });
    final dbRefrence = FirebaseDatabase.instance.ref('Sales Return');
    dbRefrence.child(salereturnid).set({
      'salereturnid': salereturnid,
      'name': nameController.text.toString(),
      'quantity': quantController.text.toString(),
      'price': priceController.text.toString(),
      'grand total': gtController.text.toString(),
      'reason': reasonController.text.toString(),
    });

    final oo = FirebaseDatabase.instance.ref('Inventory').child(id!);
    // DataSnapshot ss = oo.once();
    oo.onValue.listen((event) {
      if (chk == 0) {
        Map<dynamic, dynamic> data =
            event.snapshot.value as Map<dynamic, dynamic>;
        addQty = int.parse(data['quantity'].toString()) +
            int.parse(quantController.text.toString());
        chk = 1;
        ref.child(saleid.toString()).remove();
        refr.child(id!).update({'inv_id': id, 'quantity': addQty});
      }
    });
  }

  @override
  void initState() {
    nameController.text = widget.name;
    quantController.text = widget.quantity;
    priceController.text = widget.price;
    gtController.text = widget.grandTotal;

    saleid = widget.saleid;
    id = widget.inv_id;
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CustomerSale()));
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text("Add Sales Return"),
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
                  controller: quantController,
                  decoration: const InputDecoration(
                      labelText: 'Quantity', border: OutlineInputBorder()),
                  onChanged: (value) {
                    purchase = value;
                    addQty = originalQty + int.parse(quantController.text);
                  },
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

                /// reason
                TextFormField(
                  controller: reasonController,
                  decoration: const InputDecoration(
                      labelText: 'Reason', border: OutlineInputBorder()),
                  onChanged: (value) => purchase = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'This field is requried';
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
                          addreturn();

                          // print("Sale id: " + saleid.toString());
                          // print("Inv id: " + id.toString());
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Sale Return Added')),
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
