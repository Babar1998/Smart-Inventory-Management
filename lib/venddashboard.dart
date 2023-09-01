import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simsfyp/login.dart';
import 'package:simsfyp/vendpurchaseorder.dart';
import 'package:simsfyp/vendsettings.dart';
import 'package:simsfyp/vendprofile.dart';
import 'package:simsfyp/vendinvoices.dart';
import 'package:simsfyp/vendcreditnotes.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class vendordashboard extends StatefulWidget {
  const vendordashboard({super.key});

  @override
  _vendordashboardState createState() => _vendordashboardState();
}

class _vendordashboardState extends State<vendordashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text('Vendor Dashboard'),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const vendorprofile()));
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
                image: AssetImage('assets/IMS3.jpg'), fit: BoxFit.fill)),
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
                      color: Colors.cyan,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: VendorPurchase(),
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
                                  child: VendorCredit(),
                                  type: PageTransitionType
                                      .rightToLeftWithFade))
                              .then((value) => setState(() {}));
                        },
                        child: Text(
                          'Credit Notes: 4',
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
                        text: 'Invoices',
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                        onPress: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: VendorInvoice(),
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
                                  child: VendorCredit(),
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
                                  child: VendorPurchase(),
                                  type:
                                  PageTransitionType.rightToLeftWithFade));
                        },
                        gradient:
                        LinearGradient(colors: [Colors.black, Colors.blue]),
                        isReverse: false,
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
              context, MaterialPageRoute(builder: (context) => VendorSettingsPage()));
        },
        child: const Icon(Icons.settings),
      ),
    );
  }
}
