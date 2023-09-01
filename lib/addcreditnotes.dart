// ignore_for_file: unused_local_variable

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:simsfyp/vendpurchaseorder.dart';

class AddCreditNote extends StatefulWidget {
  final String name;
  final String quantity;
  final String price;
  final String grandTotal;
  final String purchaseid;
  const AddCreditNote(
      this.name, this.quantity, this.price, this.grandTotal, this.purchaseid,
      {Key? key})
      : super(key: key);

  @override
  State<AddCreditNote> createState() => _AddCreditNoteState();
}

class _AddCreditNoteState extends State<AddCreditNote> {
  final nameController = TextEditingController();
  final quantController = TextEditingController();
  final priceController = TextEditingController();
  final gtController = TextEditingController();
  TextEditingController remainController = TextEditingController();
  final dbShowRefrence = FirebaseDatabase.instance.ref('Purchase Order');
  DatabaseReference ref = FirebaseDatabase.instance.ref('Purchase Order');
  String? purchaseid;
  String? remain;
  String creditnid = DateTime.now().microsecondsSinceEpoch.toString();

  void addcredit() {
    setState(() {
      String name = nameController.text.toLowerCase();
      String quantity = quantController.text.toLowerCase();
      String price = priceController.text.toLowerCase();
    });
    final dbRefrence = FirebaseDatabase.instance.ref('Credit Notes');
    dbRefrence.child(creditnid).set({
      'creditnid': creditnid,
      'name': nameController.text.toString(),
      'quantity': quantController.text.toString(),
      'price': priceController.text.toString(),
      'grand total': gtController.text.toString(),
      'remaining': remainController.text.toString(),
    });
  }

  @override
  void initState() {
    nameController.text = widget.name;
    quantController.text = widget.quantity;
    priceController.text = widget.price;
    gtController.text = widget.grandTotal;

    purchaseid = widget.purchaseid;
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
                  MaterialPageRoute(builder: (context) => const VendorPurchase()));
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text("Add Credit Notes"),
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
                  enabled: false,
                  controller: quantController,
                  decoration: const InputDecoration(
                      labelText: 'Quantity', border: OutlineInputBorder()),
                  onChanged: (value) {
                    purchase = value;
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

                /// grand total
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  enabled: false,
                  controller: gtController,
                  decoration: const InputDecoration(
                      labelText: 'Grand Total (\$)',
                      border: OutlineInputBorder()),
                  onChanged: (value) => purchase = value,
                ),
                const SizedBox(
                  height: 15,
                ),

                /// remaining
                TextFormField(
                  controller: remainController,
                  decoration: const InputDecoration(
                      labelText: 'Remaining (\$)',
                      border: OutlineInputBorder()),
                  onChanged: (value) => purchase = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter remaing amount';
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
                          addcredit();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Credit Note Added')),
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
