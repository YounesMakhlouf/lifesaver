import 'package:flutter/material.dart';

import '../blood_group_dropdown_menu.dart';
import 'profile_page.dart';

class DemandeDon extends StatelessWidget {
  const DemandeDon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demander un don"),
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 50),
        child: FormContainerWidget(),
      ),
    );
  }
}

class FormContainerWidget extends StatefulWidget {
  const FormContainerWidget({super.key});

  @override
  FormContainerWidgetState createState() {
    return FormContainerWidgetState();
  }
}

class FormContainerWidgetState extends State<FormContainerWidget> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final infoController = TextEditingController();
  final bloodGroupController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    phoneController.dispose();
    infoController.dispose();
    bloodGroupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Entrer le nom du bénéficiaire',
                  labelText: 'Nom du bénéficiaire',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom du bénéficiaire';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BloodGroupDropdownMenu(
                controller: bloodGroupController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Age',
                  labelText: 'Age',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer l\'âge';
                  } else if (int.tryParse(value) == null) {
                    return 'Veuillez entrer un âge valide';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: 'Entrer un numéro de téléphone',
                  labelText: 'Téléphone',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un numéro de téléphone';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: infoController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.medical_information),
                  hintText: 'Informations médicales supplémentaires',
                  labelText: 'Informations médicales supplémentaires',
                ),
                maxLines: 3,
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 5),
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text('Valider la demande'),
                    ),
                  ),
                  ElevatedButton(
                    child: const Text('Annuler'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String name = nameController.text.trim();
      String bloodGroup = bloodGroupController.text.trim();
      int age = int.parse(ageController.text.trim());
      String phone = phoneController.text.trim();
      String additionalInfo = infoController.text.trim();

      // For now, we just print the data
      print('Name: $name');
      print('Blood Group: $bloodGroup');
      print('Age: $age');
      print('Phone: $phone');
      print('Additional Info: $additionalInfo');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Demande soumise avec succès')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
  }
}
