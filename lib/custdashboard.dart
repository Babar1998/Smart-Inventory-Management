import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simsfyp/login.dart';
import 'package:simsfyp/custsettings.dart';
import 'package:simsfyp/custprofile.dart';
import 'package:simsfyp/custsalesorder.dart';
import 'package:simsfyp/custbill.dart';
import 'package:simsfyp/custfeedback.dart';
import 'package:simsfyp/custsalesreturn.dart';
import 'package:simsfyp/custpackages.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class customerdashboard extends StatefulWidget {
  const customerdashboard({super.key});

  @override
  _customerdashboardState createState() => _customerdashboardState();
}

class _customerdashboardState extends State<customerdashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text('Customer Dashboard'),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const customerprofile()));
              },
              icon: const Icon(Icons.person),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const login()));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logged Out Successfully')),
                );
              },
              icon: const Icon(Icons.logout),
            ),
          ]),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/IMS2.jpg'), fit: BoxFit.fill)),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 100.0,
                      width: 170.0,
                      color: Colors.blueAccent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: CustomerSale(),
                                  type: PageTransitionType
                                      .rightToLeftWithFade))
                              .then((value) => setState(() {}));
                        },
                        child: Text(
                          'Sales Order: 3',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 100.0,
                      width: 170.0,
                      color: Colors.orange,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: CustReturn(),
                                  type: PageTransitionType
                                      .rightToLeftWithFade))
                              .then((value) => setState(() {}));
                        },
                        child: Text(
                          'Sales Return: 5',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 600.0,
                  child: GridView.count(
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    crossAxisCount: 2,
                    children: <Widget>[
                      AnimatedButton(
                        height: 160,
                        width: 160,
                        borderRadius: 20,
                        text: 'Sales Order',
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                        onPress: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: CustomerSale(),
                                  type:
                                  PageTransitionType.rightToLeftWithFade));
                        },
                        gradient:
                        LinearGradient(colors: [Colors.black, Colors.blue]),
                      ),
                      AnimatedButton(
                        height: 160,
                        width: 160,
                        borderRadius: 20,
                        text: 'Packages',
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                        onPress: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: CustPackage(),
                                  type:
                                  PageTransitionType.rightToLeftWithFade));
                        },
                        gradient:
                        LinearGradient(colors: [Colors.black, Colors.blue]),
                      ),
                      AnimatedButton(
                        height: 160,
                        width: 160,
                        borderRadius: 20,
                        text: 'Sales Return',
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                        onPress: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: CustReturn(),
                                  type:
                                  PageTransitionType.rightToLeftWithFade));
                        },
                        gradient:
                        LinearGradient(colors: [Colors.black, Colors.blue]),
                      ),
                      AnimatedButton(
                        height: 160,
                        width: 160,
                        borderRadius: 20,
                        text: 'Bills',
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                        onPress: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: CustomerBill(),
                                  type:
                                  PageTransitionType.rightToLeftWithFade));
                        },
                        gradient:
                        LinearGradient(colors: [Colors.black, Colors.blue]),
                      ),
                      AnimatedButton(
                        height: 160,
                        width: 160,
                        borderRadius: 20,
                        text: 'Feedback',
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                        onPress: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: customerfeedback(),
                                  type:
                                  PageTransitionType.rightToLeftWithFade));
                        },
                        gradient:
                        LinearGradient(colors: [Colors.black, Colors.blue]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CustomerSettingsPage()));
        },
        child: const Icon(Icons.settings),
      ),
    );
  }
}
