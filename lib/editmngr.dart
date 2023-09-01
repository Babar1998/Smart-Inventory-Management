import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:simsfyp/adminmanager.dart';

class EditManager extends StatefulWidget {
  final String email;
  final String password;
  final String id;
  const EditManager(this.email, this.password, this.id, {Key? key})
      : super(key: key);

  @override
  State<EditManager> createState() => _EditManagerState();
}

class _EditManagerState extends State<EditManager> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final dbShowRefrence = FirebaseDatabase.instance.ref('Managers');
  DatabaseReference ref = FirebaseDatabase.instance.ref('Managers');
  String? id;

  @override
  void initState() {
    emailController.text = widget.email;
    passwordController.text = widget.password;

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
                  context, MaterialPageRoute(builder: (context) => const Manager()));
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text("Edit Manager Details"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// email
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      labelText: 'Manager Email', border: OutlineInputBorder()),
                  onChanged: (value) => vendor = value,
                ),

                const SizedBox(
                  height: 15,
                ),

                /// password
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      labelText: 'Password', border: OutlineInputBorder()),
                  onChanged: (value) => vendor = value,
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
                              builder: (context) => const Manager(),
                            ),
                          );
                          ref.child(id!).update({
                            'id': id,
                            'email': emailController.text.toString(),
                            'password': passwordController.text.toString(),
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
