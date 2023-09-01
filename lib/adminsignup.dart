// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simsfyp/login.dart';

class AdminSignUp extends StatefulWidget {
  const AdminSignUp({Key? key}) : super(key: key);

  @override
  State<AdminSignUp> createState() => _AdminSignUpState();
}

class _AdminSignUpState extends State<AdminSignUp> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrmpasswordController = TextEditingController();
  String id = DateTime.now().microsecondsSinceEpoch.toString();

  FirebaseAuth auth = FirebaseAuth.instance;

  String userEmail = '';
  String password = '';
  String confirmPassword = '';

  //sign up useers email
  void admin() {
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
    final dbRefrence = FirebaseDatabase.instance.ref('Managers');
    dbRefrence.child(id).set({
      'id': id,
      'email': emailController.text.toString(),
      'password': passwordController.text.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add New Manager"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      return 'Please enter your email address';
                    }
                    // Check if the entered email has the right format
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    // Return null if the entered email is valid
                    return null;
                  },
                  onChanged: (value) => userEmail = value,
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
                          admin();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const login()));
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
