import 'package:blood_donation/blood_group_dropdown_menu.dart';
import 'package:blood_donation/constants/constants.dart';
import 'package:blood_donation/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../my_home_page.dart';
import '../widgets/custom_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final cinController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final bloodGroupController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  bool _isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    cinController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    bloodGroupController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(), // User can't select a future date of birth
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _signup() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        User? user = await _auth.signUpWithEmailAndPassword(
          emailController.text.trim(),
          passwordController.text,
        );
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()),
          );
        }
      } on FirebaseAuthException catch (e) {
        // Display the error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Une erreur est survenue.')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
      appBar: AppBar(title: const Text("Créer un compte")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomForm(
          formKey: _formKey,
          fields: [
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre nom complet';
                }
                return null;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Entrez votre nom et prénom',
                labelText: 'Nom complet',
              ),
            ),
            // CIN Input
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
                hintText: 'CIN/Passeport',
                labelText: 'CIN/Passeport',
              ),
            ),
            // Email Input
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.enterEmail;
                } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return 'Entrez une adresse e-mail valide';
                }
                return null;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.mail),
                hintText: 'Adresse e-mail',
                labelText: 'E-mail',
              ),
            ),
            // Password Input
            TextFormField(
              controller: passwordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un mot de passe';
                } else if (value.length < 6) {
                  return 'Le mot de passe doit comporter au moins 6 caractères';
                }
                return null;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.lock),
                hintText: 'Mot de passe',
                labelText: 'Mot de passe',
              ),
            ),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez confirmer votre mot de passe';
                } else if (value != passwordController.text) {
                  return 'Les mots de passe ne correspondent pas';
                }
                return null;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.lock),
                hintText: 'Confirmez votre mot de passe',
                labelText: 'Confirmer le mot de passe',
              ),
            ),
            SizedBox(
              height: 50,
              child: BloodGroupDropdownMenu(
                controller: bloodGroupController,
              ),
            ),
            // Date Picker
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text(
                  'Date de naissance:${'${selectedDate.toLocal()}'.split(' ')[0]}'),
              trailing: ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text('Sélectionner'),
              ),
            ),
          ],
          onSubmit: _signup,
          submitButtonText: 'Se connecter',
        ),
      ),
    );
  }
}
