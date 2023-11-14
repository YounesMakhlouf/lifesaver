import 'package:flutter/material.dart';

class BloodGroupDropdownMenu extends StatefulWidget {
  const BloodGroupDropdownMenu({super.key});

  @override
  State<BloodGroupDropdownMenu> createState() => _BloodGroupDropdownMenuState();
}

class _BloodGroupDropdownMenuState extends State<BloodGroupDropdownMenu> {
  String? selectedItem = BloodGroups[0];

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<String>> bloodGroupEntries =
        <DropdownMenuEntry<String>>[];
    for (final String bloodGroup in BloodGroups) {
      bloodGroupEntries.add(
        DropdownMenuEntry<String>(value: bloodGroup, label: bloodGroup),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              DropdownMenu<String>(
                initialSelection: selectedItem,
                label: const Text('Groupe sanguin'),
                dropdownMenuEntries: bloodGroupEntries,
                onSelected: (String? bloodGroup) {
                  setState(() {
                    selectedItem = bloodGroup;
                  });
                },
              ),
              const SizedBox(width: 1),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> BloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
