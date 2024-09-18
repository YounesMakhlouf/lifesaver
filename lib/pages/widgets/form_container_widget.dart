import 'package:blood_donation/blood_group_dropdown_menu.dart';
import 'package:blood_donation/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../my_home_page.dart';

class FormContainerWidget extends StatefulWidget {
  const FormContainerWidget({super.key});

  @override
  FormContainerWidgetState createState() {
    return FormContainerWidgetState();
  }
}

class FormContainerWidgetState extends State<FormContainerWidget> {
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
      String name = nameController.text.trim();
      String cin = cinController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text;
      String bloodGroup = bloodGroupController.text;

      try {
        User? user = await _auth.signUpWithEmailAndPassword(email, password);
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Erreur lors de l\'inscription : ${e.toString()}')),
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
        : Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Name Input
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
                  const SizedBox(height: 16),
                  // CIN Input
                  TextFormField(
                    controller: cinController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre CIN/Passeport';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.perm_identity),
                      hintText: 'CIN/Passeport',
                      labelText: 'CIN/Passeport',
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Email Input
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre adresse e-mail';
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
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child:
                        SizedBox(height: 105, child: BloodGroupDropdownMenu()),
                  ),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 32),
                  // Submit Button
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: _signup,
                      child: const Text('Valider'),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
