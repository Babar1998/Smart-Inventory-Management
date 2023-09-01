import 'package:flutter/material.dart';
import 'package:simsfyp/admindashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simsfyp/custdashboard.dart';
import 'package:simsfyp/venddashboard.dart';
import 'package:simsfyp/adminsignup.dart';
import 'package:simsfyp/customersignup.dart';
import 'package:simsfyp/vendorsignup.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();

  String userEmail = '';
  String password = '';
  String? errorMessage = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  //if user click on login page
  void adminlogin() {
    auth
        .signInWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    )
        .then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => admindashboard()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logged in Successfully')),
      );
    });
  }

  void custlogin() {
    auth
        .signInWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    )
        .then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => customerdashboard()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logged in Successfully')),
      );
    });
  }

  void vendlogin() {
    auth
        .signInWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    )
        .then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => vendordashboard()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logged in Successfully')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 150,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/Pic.png'),
                      radius: 40.0,
                    )),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 60, right: 10, left: 10),
                child: Column(
                  children: [
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
                          labelText: 'Password',
                          border: OutlineInputBorder()),
                      obscureText: true,
                      obscuringCharacter: "*",
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'This field is required';
                        }
                        if (value.trim().length < 6 ||
                            value.trim().length > 16) {
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
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            adminlogin();
                          }
                        },
                        child: const Text(
                          'Admin Login',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminSignUp()))
                          .then((value) => setState(() {}));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Create Admin Account",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                            'Sign up',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15)
                        )
                    ]
                        )
                )
                      ],
                    ),
            Column(
              children: [
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        custlogin();
                      }
                    },
                    child: const Text(
                      'Customer Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),

                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CustomerSignUp()))
                        .then((value) => setState(() {}));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Create Customer Account",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                          'Sign up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15))

                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        vendlogin();
                      }
                    },
                    child: const Text(
                      'Vendor Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VendorSignUp()))
                        .then((value) => setState(() {}));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Create Vendor Account",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                          'Sign up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15))

                    ],
                  ),
                ),
              ],
            ),
                ]
            ),
      ),
    );
  }
}
