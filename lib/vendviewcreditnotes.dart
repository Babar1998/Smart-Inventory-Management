import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:simsfyp/vendcreditnotes.dart';

class VendorViewCredit extends StatefulWidget {
  final String name;
  final String quantity;
  final String price;
  final String grandTotal;
  final String creditnid;
  final String remain;
  const VendorViewCredit(this.name, this.quantity, this.price, this.grandTotal,
      this.remain, this.creditnid,
      {Key? key})
      : super(key: key);

  @override
  State<VendorViewCredit> createState() => _VendorViewCreditState();
}

class _VendorViewCreditState extends State<VendorViewCredit> {
  final nameController = TextEditingController();
  final quantController = TextEditingController();
  final priceController = TextEditingController();
  final gtController = TextEditingController();
  final remainController = TextEditingController();
  final dbShowRefrence = FirebaseDatabase.instance.ref('Credit Notes');
  DatabaseReference ref = FirebaseDatabase.instance.ref('Credit Notes');
  String? creditnid;

  @override
  void initState() {
    nameController.text = widget.name;
    quantController.text = widget.quantity;
    priceController.text = widget.price;
    gtController.text = widget.grandTotal;
    remainController.text = widget.remain;

    creditnid = widget.creditnid;
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
                  MaterialPageRoute(builder: (context) => const VendorCredit()));
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text("Credit Note Detail"),
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

              /// grand total
              TextField(
                style: TextStyle(color: Colors.black),
                enabled: false,
                controller: remainController,
                decoration: const InputDecoration(
                    labelText: 'Remaing (\$)', border: OutlineInputBorder()),
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
                          builder: (context) => const VendorCredit(),
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
