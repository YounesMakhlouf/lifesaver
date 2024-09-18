import 'package:blood_donation/pages/my_home_page.dart';
import 'package:blood_donation/pages/start_pages/start_page1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // If the user is logged in, show the home page
        if (snapshot.hasData) {
          return const MyHomePage();
        }

        // Otherwise, show the start pages
        return const Main1Page();
      },
    );
  }
}