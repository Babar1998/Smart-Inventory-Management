import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:simsfyp/admincustomer.dart';

class EditCustomer extends StatefulWidget {
  final String name;
  final String number;
  final String email;
  final String id;
  const EditCustomer(this.name, this.number, this.email, this.id, {Key? key})
      : super(key: key);

  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final dbShowRefrence = FirebaseDatabase.instance.ref('Customers');
  DatabaseReference ref = FirebaseDatabase.instance.ref('Customers');
  String? id;

  @override
  void initState() {
    nameController.text = widget.name;
    numberController.text = widget.number;
    emailController.text = widget.email;

    id = widget.id;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  String customer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Customer()));
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text("Edit Customer Details"),
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
                      labelText: 'Customer Name', border: OutlineInputBorder()),
                  onChanged: (value) => customer = value,
                ),

                const SizedBox(
                  height: 15,
                ),

                /// number
                TextFormField(
                  controller: numberController,
                  decoration: const InputDecoration(
                      labelText: 'Phone No.', border: OutlineInputBorder()),
                  onChanged: (value) => customer = value,
                ),
                const SizedBox(
                  height: 15,
                ),

                /// email
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                  onChanged: (value) => customer = value,
                ),
                const SizedBox(
                  height: 15,
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
                              builder: (context) => const Customer(),
                            ),
                          );
                          ref.child(id!).update({
                            'id': id,
                            'name': nameController.text.toString(),
                            'number': numberController.text.toString(),
                            'email': emailController.text.toString(),
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
