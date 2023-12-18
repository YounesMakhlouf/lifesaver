import 'package:blood_donation/pages/my_home_page.dart';
import 'package:blood_donation/pages/start_pages/start_page1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser?.uid == null) {
      return const Main1Page();
    } else {
      return const MyHomePage();
    }
  }
}
