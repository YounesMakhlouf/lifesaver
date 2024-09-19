import 'package:blood_donation/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';
import '../my_home_page.dart';
import '../widgets/custom_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final _formKey = GlobalKey<FormState>();
  final cinController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    passwordController.dispose();
    cinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Bienvenue")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomForm(
          formKey: _formKey,
          fields: [
            TextFormField(
              controller: cinController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.enterCIN;
                }
                return null;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.perm_identity),
                hintText: 'CIN',
                labelText: 'CIN',
              ),
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.enterPassword;
                }
                return null;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.lock),
                hintText: 'Mot de passe',
                labelText: 'Mot de passe',
              ),
            ),
          ],
          onSubmit: _signin,
          submitButtonText: 'Se connecter',
        ),
      ),
    );
  }

  void _signin() async {
    String cin = cinController.text;
    String password = passwordController.text;
    if (_formKey.currentState!.validate()) {
      // Show a loading indicator
      setState(() {
        _isLoading = true;
      });
      try {
        User? user = await _auth.signInWithEmailAndPassword(cin, password);
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()),
          );
        }
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Une erreur est survenue.')),
        );
      } finally {
        // Hide the loading indicator
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
