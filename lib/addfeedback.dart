// ignore_for_file: unused_local_variable

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:simsfyp/adminfeedback.dart';

class AddFeedback extends StatefulWidget {
  const AddFeedback({Key? key}) : super(key: key);

  @override
  State<AddFeedback> createState() => _AddFeedbackState();
}

class _AddFeedbackState extends State<AddFeedback> {
  final nameController = TextEditingController();
  final fbController = TextEditingController();
  String id = DateTime.now().microsecondsSinceEpoch.toString();

  void addfeedback() {
    setState(() {
      String name = nameController.text.toLowerCase();
      String feedback = fbController.text.toLowerCase();
    });
    final dbRefrence = FirebaseDatabase.instance.ref('Feedback');
    dbRefrence.child(id).set({
      'id': id,
      'name': nameController.text.toString(),
      'feedback': fbController.text.toString(),
    });
  }

  final _formKey = GlobalKey<FormState>();
  String fb = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Feedback"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Name
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your Name';
                    }
                    // Return null if the entered email is valid
                    return null;
                  },
                  onChanged: (value) => fb = value,
                ),

                const SizedBox(
                  height: 15,
                ),

                /// Feedback
                TextFormField(
                  controller: fbController,
                  decoration: const InputDecoration(
                      labelText: 'Feedback', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your Feedback';
                    }
                    // Return null if the entered email is valid
                    return null;
                  },
                  onChanged: (value) => fb = value,
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
                          addfeedback();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const adminfeedback(),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Stock Added Successfully')),
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
