import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simsfyp/login.dart';
import 'package:simsfyp/adminpurchaseorder.dart';
import 'package:simsfyp/adminsettings.dart';
import 'package:simsfyp/adminprofile.dart';
import 'package:simsfyp/inventory.dart';
import 'package:simsfyp/admincustomer.dart';
import 'package:simsfyp/adminvendor.dart';
import 'package:simsfyp/adminmanager.dart';
import 'package:simsfyp/adminsalesorder.dart';
import 'package:simsfyp/adminbills.dart';
import 'package:simsfyp/admininvoices.dart';
import 'package:simsfyp/adminfeedback.dart';
import 'package:simsfyp/admincreditnotes.dart';
import 'package:simsfyp/adminsalesreturn.dart';
import 'package:simsfyp/adminpackages.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class admindashboard extends StatefulWidget {
  const admindashboard({super.key});

  @override
  _admindashboardState createState() => _admindashboardState();
}

class _admindashboardState extends State<admindashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text('Admin Dashboard'),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const adminprofile()));
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
                image: AssetImage('assets/IMS1.jpg'), fit: BoxFit.fill)),
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
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.red, Colors.orange])),
                      alignment: Alignment.center,
                      height: 100.0,
                      width: 170.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                                  context,
                                  PageTransition(
                                      child: Inventory(),
                                      type: PageTransitionType
                                          .rightToLeftWithFade))
                              .then((value) => setState(() {}));
                        },
                        child: Text(
                          'Inventory: 4',
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
                      color: Colors.blueAccent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                                  context,
                                  PageTransition(
                                      child: AdminSale(),
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
                ],
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
                      color: Colors.cyan,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                                  context,
                                  PageTransition(
                                      child: AdminPurchase(),
                                      type: PageTransitionType
                                          .rightToLeftWithFade))
                              .then((value) => setState(() {}));
                        },
                        child: Text(
                          'Purchase Order: 5',
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
                                      child: AdminReturn(),
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
                    crossAxisCount: 3,
                    children: <Widget>[
                      AnimatedButton(
                        height: 150,
                        width: 150,
                        borderRadius: 20,
                        text: 'Inventory',
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                        transitionType: TransitionType.BOTTOM_TO_TOP,
                        onPress: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: Inventory(),
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
                        text: 'Customers',
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                        onPress: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: Customer(),
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
                        text: 'Sales Order',
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                        onPress: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: AdminSale(),
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
                        text: 'Managers',
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                        onPress: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: Manager(),
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
                                  child: AdminPackage(),
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
                        text: 'Invoices',
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                        onPress: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: AdminInvoice(),
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
                                  child: AdminReturn(),
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
                        text: 'Credit Notes',
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                        onPress: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: AdminCredit(),
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
                        text: 'Vendors',
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                        onPress: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: Vendor(),
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
                        text: 'Purchase Order',
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                        onPress: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: AdminPurchase(),
                                  type:
                                      PageTransitionType.rightToLeftWithFade));
                        },
                        gradient:
                            LinearGradient(colors: [Colors.black, Colors.blue]),
                        isReverse: false,
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
                                  child: AdminBill(),
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
                                  child: adminfeedback(),
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
              context, MaterialPageRoute(builder: (context) => AdminSettingsPage()));
        },
        child: const Icon(Icons.settings),
      ),
    );
  }
}
