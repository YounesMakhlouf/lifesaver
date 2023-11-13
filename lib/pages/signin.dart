import 'package:blood_donation/main.dart';
import 'package:flutter/material.dart';

import '../dropdownmenuexemple.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

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
              child: Text("Créer un compte",
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
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
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
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Entrer votre nom et prenom',
                  labelText: 'Nom comlpet',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
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
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  hintText: 'Email',
                  labelText: 'Email',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: SizedBox(height: 105, child: DropdownMenuExample()),
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
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 40.0, bottom: 5),
                      child: ElevatedButton(
                        child: const Text('Valider'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyHomePage()),
                          );
                        },
                      )),
                  ElevatedButton(
                      child: const Text('Annuler'),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/myapphome');
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
