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
  final nameController = TextEditingController();
  final cinController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    cinController.dispose();
    emailController.dispose();
    super.dispose();
  }

  // Create a global key that uniquely identifies the Form widget and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2024));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Entrer votre nom et prenom',
                  labelText: 'Nom complet',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: cinController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.perm_identity),
                  hintText: 'CIN/Passeport',
                  labelText: 'CIN/Passeport',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  hintText: 'Email',
                  labelText: 'Email',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: SizedBox(height: 105, child: BloodGroupDropdownMenu()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: <Widget>[
                const Text("Date de naissance"),
                Text("${selectedDate.toLocal()}".split(' ')[0]),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Selectionner la date'),
                ),
              ]),
            ),
            Center(
              child: Container(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: _signup,
                    child: const Text('Valider'),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _signup() async {
    // String username = nameController.text;
    String email = emailController.text;
    String password = cinController.text;
    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      print('user is sucessefully created');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    } else {
      print('Some error happened');
    }
  }
}
