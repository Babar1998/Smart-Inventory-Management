import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:simsfyp/inventory.dart';

class EditInventory extends StatefulWidget {
  final String name;
  final String quantity;
  final String category;
  final String price;
  final String id;
  const EditInventory(
      this.name, this.quantity, this.category, this.price, this.id,
      {Key? key})
      : super(key: key);

  @override
  State<EditInventory> createState() => _EditInventoryState();
}

class _EditInventoryState extends State<EditInventory> {
  final nameController = TextEditingController();
  final quantController = TextEditingController();
  final catController = TextEditingController();
  final priceController = TextEditingController();
  final dbShowRefrence = FirebaseDatabase.instance.ref('Inventory');
  DatabaseReference ref = FirebaseDatabase.instance.ref('Inventory');
  String? id;

  @override
  void initState() {
    nameController.text = widget.name;
    quantController.text = widget.quantity;
    catController.text = widget.category;
    priceController.text = widget.price;

    id = widget.id;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  String inventory = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Inventory()));
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text("Edit Inventory Details"),
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
                  onChanged: (value) => inventory = value,
                ),

                const SizedBox(
                  height: 15,
                ),

                /// quantity
                TextFormField(
                  controller: quantController,
                  decoration: const InputDecoration(
                      labelText: 'Quantity', border: OutlineInputBorder()),
                  onChanged: (value) => inventory = value,
                ),
                const SizedBox(
                  height: 15,
                ),

                /// category
                TextFormField(
                  controller: catController,
                  decoration: const InputDecoration(
                      labelText: 'Category', border: OutlineInputBorder()),
                  onChanged: (value) => inventory = value,
                ),
                const SizedBox(
                  height: 15,
                ),

                /// price
                TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(
                      labelText: 'Price', border: OutlineInputBorder()),
                  onChanged: (value) => inventory = value,
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
                              builder: (context) => const Inventory(),
                            ),
                          );
                          ref.child(id!).update({
                            'id': id,
                            'name': nameController.text.toString(),
                            'quantity': quantController.text.toString(),
                            'category': catController.text.toString(),
                            'price': priceController.text.toString(),
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Detail updated Successfully')),
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
