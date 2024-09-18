import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';
import '../my_home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          title: const Text("Bienvenue",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22)),
          elevation: 20,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100))),
        ),
        body: const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 50),
          child: FormContainerWidget(),
        ),
      ),
    );
  }
}

// Create a Form widget.
class FormContainerWidget extends StatefulWidget {
  const FormContainerWidget({super.key});

  @override
  FormContainerWidgetState createState() {
    return FormContainerWidgetState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class FormContainerWidgetState extends State<FormContainerWidget> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final cinController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;
  int expectedLength = 8;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    passwordController.dispose();
    cinController.dispose();
    super.dispose();
  }

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: cinController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre CIN';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.perm_identity),
                  hintText: 'CIN',
                  labelText: 'CIN',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: 'Mot de passe',
                  labelText: 'Mot de passe',
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 40.0, bottom: 5),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: _signin,
                      child: const Text('Se connecter')),
                )),
          ],
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
          print('User successfully signed in');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()),
          );
        }
      } catch (e) {
        // Display an error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Échec de la connexion : ${e.toString()}')),
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
