import 'package:blood_donation/pages/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class BloodDonationApp extends StatelessWidget {
  const BloodDonationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize Firebase
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text(
                  'Erreur lors de l\'initialisation de Firebase',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          final ThemeData theme = ThemeData(
            primaryColor: Colors.red,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
            useMaterial3: true,
          );
          return MaterialApp(
            home: const Wrapper(),
            title: 'Tbara3',
            theme: theme,
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const MaterialApp(
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
