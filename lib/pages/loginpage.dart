import 'package:blood_donation/main.dart';
import 'package:flutter/material.dart';

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
          title: const Center(
              child: Text("Bienvenue",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22))),
          elevation: 20,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100))),
        ),
        body: const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 50),
          child: MyCustomForm(),
        ),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final cinController = TextEditingController();
  final passwordController = TextEditingController();

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
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                  hintText: 'CIN',
                  labelText: 'CIN',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
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
                    child: const Text('Se connecter'),
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage()),
                        );
                      }
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
