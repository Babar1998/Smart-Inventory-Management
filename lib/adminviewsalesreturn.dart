import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:simsfyp/adminsalesreturn.dart';

class AdminViewReturn extends StatefulWidget {
  final String name;
  final String quantity;
  final String price;
  final String grandTotal;
  final String salereturnid;
  final String reason;
  const AdminViewReturn(this.name, this.quantity, this.price, this.grandTotal,
      this.reason, this.salereturnid,
      {Key? key})
      : super(key: key);

  @override
  State<AdminViewReturn> createState() => _AdminViewReturnState();
}

class _AdminViewReturnState extends State<AdminViewReturn> {
  final nameController = TextEditingController();
  final quantController = TextEditingController();
  final priceController = TextEditingController();
  final gtController = TextEditingController();
  final reasonController = TextEditingController();
  final dbShowRefrence = FirebaseDatabase.instance.ref('Sales Return');
  DatabaseReference ref = FirebaseDatabase.instance.ref('sales Return');
  String? salereturnid;

  @override
  void initState() {
    nameController.text = widget.name;
    quantController.text = widget.quantity;
    priceController.text = widget.price;
    gtController.text = widget.grandTotal;
    reasonController.text = widget.reason;

    salereturnid = widget.salereturnid;
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AdminReturn()));
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text("Sale Return Detail"),
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
                onChanged: (value) => sale = value,
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
                onChanged: (value) {
                  sale = value;
                },
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
                onChanged: (value) => sale = value,
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
                onChanged: (value) => sale = value,
              ),
              const SizedBox(
                height: 15,
              ),

              /// grand total
              TextField(
                style: TextStyle(color: Colors.black),
                enabled: false,
                controller: reasonController,
                decoration: const InputDecoration(
                    labelText: 'Reason', border: OutlineInputBorder()),
                onChanged: (value) => sale = value,
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
                          builder: (context) => const AdminReturn(),
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
