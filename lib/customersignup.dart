// ignore_for_file: unused_local_variable

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:simsfyp/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomerSignUp extends StatefulWidget {
  const CustomerSignUp({Key? key}) : super(key: key);

  @override
  State<CustomerSignUp> createState() => _CustomerSignUpState();
}

class _CustomerSignUpState extends State<CustomerSignUp> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrmpasswordController = TextEditingController();
  String id = DateTime.now().microsecondsSinceEpoch.toString();

  FirebaseAuth auth = FirebaseAuth.instance;

  String userEmail = '';
  String password = '';
  String confirmPassword = '';

  //sign up useers email
  void customer() {
    auth
        .createUserWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    )
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account Created Successfully')),
      );
    });
    setState(() {
      String email = emailController.text.toLowerCase();
      String password = passwordController.text.toLowerCase();
    });
    final dbRefrence = FirebaseDatabase.instance.ref('Customers');
    dbRefrence.child(id).set({
      'id': id,
      'name': nameController.text.toString(),
      'number': numberController.text.toString(),
      'email': emailController.text.toString(),
      'password': passwordController.text.toString(),
    });
  }

  final _formKey = GlobalKey<FormState>();
  String cust = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Customer Signup"),
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
                    labelText: 'Customer Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter Customer Name';
                    }
                    // Return null if the entered email is valid
                    return null;
                  },
                  onChanged: (value) => cust = value,
                ),

                const SizedBox(
                  height: 15,
                ),

                /// Phone Number
                TextFormField(
                  controller: numberController,
                  decoration: const InputDecoration(
                      labelText: 'Phone Number', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter Mobile No.';
                    }
                    // Return null if the entered email is valid
                    return null;
                  },
                  onChanged: (value) => cust = value,
                ),
                const SizedBox(
                  height: 15,
                ),

                /// Email
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter email';
                    }
                    // Return null if the entered email is valid
                    return null;
                  },
                  onChanged: (value) => cust = value,
                ),
                const SizedBox(
                  height: 15,
                ),

                /// Password
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      labelText: 'Password', border: OutlineInputBorder()),
                  obscureText: true,
                  obscuringCharacter: "*",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'This field is required';
                    }
                    if (value.trim().length < 6 || value.trim().length > 16) {
                      return 'Password must be between 6 & 16 characters';
                    }
                    // Return null if the entered password is valid
                    return null;
                  },
                  onChanged: (value) => password = value,
                ),
                const SizedBox(
                  height: 15,
                ),

                /// Confirm Password
                TextFormField(
                  controller: confrmpasswordController,
                  decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder()),
                  obscureText: true,
                  obscuringCharacter: "*",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }

                    if (value != password) {
                      return 'Confirmation password does not match the entered password';
                    }

                    return null;
                  },
                  onChanged: (value) => confirmPassword = value,
                ),


                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          customer();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const login(),
                            ),
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
