import 'dart:async';

import 'package:blood_donation/pages/ProfilePage.dart';
import 'package:flutter/material.dart';

class ParticipatedPage extends StatefulWidget {
  const ParticipatedPage({super.key});

  @override
  State<ParticipatedPage> createState() => _ParticipatedPageState();
}

class _ParticipatedPageState extends State<ParticipatedPage> {
  @override
  void initState() {
    super.initState();
    // Delayed navigation to the next page
    Timer(const Duration(seconds: 1), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset("images/check.png")));
  }
}
