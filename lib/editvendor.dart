import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:simsfyp/adminvendor.dart';

class EditVendor extends StatefulWidget {
  final String name;
  final String number;
  final String email;
  final String id;
  const EditVendor(this.name, this.number, this.email, this.id, {Key? key})
      : super(key: key);

  @override
  State<EditVendor> createState() => _EditVendorState();
}

class _EditVendorState extends State<EditVendor> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final dbShowRefrence = FirebaseDatabase.instance.ref('Vendors');
  DatabaseReference ref = FirebaseDatabase.instance.ref('Vendors');
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
  String vendor = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Vendor()));
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text("Edit Vendor Details"),
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
                      labelText: 'Vendor Name', border: OutlineInputBorder()),
                  onChanged: (value) => vendor = value,
                ),

                const SizedBox(
                  height: 15,
                ),

                /// number
                TextFormField(
                  controller: numberController,
                  decoration: const InputDecoration(
                      labelText: 'Phone No.', border: OutlineInputBorder()),
                  onChanged: (value) => vendor = value,
                ),
                const SizedBox(
                  height: 15,
                ),

                /// email
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                  onChanged: (value) => vendor = value,
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
                              builder: (context) => const Vendor(),
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
