import 'package:flutter/material.dart';

class BloodGroupDropdownMenu extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  const BloodGroupDropdownMenu({
    super.key,
    required this.controller,
    this.labelText = 'Groupe sanguin',
  });

  @override
  State<BloodGroupDropdownMenu> createState() => _BloodGroupDropdownMenuState();
}

class _BloodGroupDropdownMenuState extends State<BloodGroupDropdownMenu> {
  final List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];

  @override
  void initState() {
    super.initState();
    if (widget.controller.text.isEmpty) {
      widget.controller.text = bloodGroups[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.controller.text,
      decoration: InputDecoration(
        icon: const Icon(Icons.bloodtype),
        labelText: widget.labelText,
      ),
      items: bloodGroups.map((String bloodGroup) {
        return DropdownMenuItem<String>(
          value: bloodGroup,
          child: Text(bloodGroup),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          widget.controller.text = newValue!;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Veuillez sélectionner votre groupe sanguin';
        }
        return null;
      },
    );
  }
}
