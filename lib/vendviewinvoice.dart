import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:simsfyp/vendinvoices.dart';

class VendorViewInvoice extends StatefulWidget {
  final String name;
  final String quantity;
  final String price;
  final String grandTotal;
  final String purchaseid;
  const VendorViewInvoice(
      this.name, this.quantity, this.price, this.grandTotal, this.purchaseid,
      {Key? key})
      : super(key: key);

  @override
  State<VendorViewInvoice> createState() => _VendorViewInvoiceState();
}

class _VendorViewInvoiceState extends State<VendorViewInvoice> {
  final nameController = TextEditingController();
  final quantController = TextEditingController();
  final priceController = TextEditingController();
  final gtController = TextEditingController();
  final dbShowRefrence = FirebaseDatabase.instance.ref('Purchase Order');
  DatabaseReference ref = FirebaseDatabase.instance.ref('Purchase Order');
  String? purchaseid;

  @override
  void initState() {
    nameController.text = widget.name;
    quantController.text = widget.quantity;
    priceController.text = widget.price;
    gtController.text = widget.grandTotal;

    purchaseid = widget.purchaseid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const VendorInvoice()));
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text("Invoice Detail"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// name
              TextField(
                style: TextStyle(color: Colors.black),
                enabled: false,
                controller: nameController,
                decoration: const InputDecoration(
                    labelText: 'Product Name', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),

              /// quantity
              TextField(
                style: TextStyle(color: Colors.black),
                enabled: false,
                controller: quantController,
                decoration: const InputDecoration(
                    labelText: 'Quantity', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),

              /// price
              TextField(
                style: TextStyle(color: Colors.black),
                enabled: false,
                controller: priceController,
                decoration: const InputDecoration(
                    labelText: 'Price (\$)', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),

              /// grand total
              TextField(
                style: TextStyle(color: Colors.black),
                enabled: false,
                controller: gtController,
                decoration: const InputDecoration(
                    labelText: 'Grand Total (\$)',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VendorInvoice(),
                        ),
                      );
                    },
                    child: const Text('OK'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
