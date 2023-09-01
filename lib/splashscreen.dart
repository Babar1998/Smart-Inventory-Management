import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simsfyp/login.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpinKitSpinningLines(
        color: Colors.blue,
        size: 100.0,
      ),
    );
  }
}
