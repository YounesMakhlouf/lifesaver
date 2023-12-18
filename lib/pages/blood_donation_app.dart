import 'package:blood_donation/pages/wrapper.dart';
import 'package:flutter/material.dart';

class BloodDonationApp extends StatelessWidget {
  const BloodDonationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Wrapper(),
      title: 'tbara3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
    );
  }
}
