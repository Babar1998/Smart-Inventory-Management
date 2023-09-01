import 'package:flutter/material.dart';
import 'package:simsfyp/venddashboard.dart';

class vendorprofile extends StatefulWidget {
  const vendorprofile({super.key});

  @override
  State<vendorprofile> createState() => _vendorprofileState();
}

class _vendorprofileState extends State<vendorprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const vendordashboard()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/Picture.jpg'),
                radius: 40.0,
              ),
            ),
            const Divider(
              height: 90.0,
              color: Colors.grey,
            ),
            const Text(
              'NAME',
              style: TextStyle(
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Babar Arif',
              style: TextStyle(
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.email,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  'babarmis108@gmail.com',
                  style: TextStyle(
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
