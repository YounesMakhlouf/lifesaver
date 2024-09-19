import 'package:blood_donation/pages/widgets/custom_form.dart';
import 'package:flutter/material.dart';

import '../blood_group_dropdown_menu.dart';
import 'profile_page.dart';

class DemandeDon extends StatefulWidget {
  const DemandeDon({super.key});

  @override
  DemandeDonState createState() {
    return DemandeDonState();
  }
}

class DemandeDonState extends State<DemandeDon> {
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
    return Scaffold(
      appBar: AppBar(title: const Text("Demander un don")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomForm(
          formKey: _formKey,
          fields: [
            TextFormField(
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
            BloodGroupDropdownMenu(
              controller: bloodGroupController,
            ),
            TextFormField(
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
            TextFormField(
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
            TextFormField(
              controller: infoController,
              decoration: const InputDecoration(
                icon: Icon(Icons.medical_information),
                hintText: 'Informations médicales supplémentaires',
                labelText: 'Informations médicales supplémentaires',
              ),
              maxLines: 3,
            ),
            ElevatedButton(
              child: const Text('Annuler'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          onSubmit: _submitForm,
          submitButtonText: 'Valider la demande',
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