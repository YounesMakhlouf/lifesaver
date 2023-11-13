import 'package:flutter/material.dart';

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  ColorLabel? selectedColor;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<ColorLabel>> colorEntries =
        <DropdownMenuEntry<ColorLabel>>[];
    for (final ColorLabel color in ColorLabel.values) {
      colorEntries.add(
        DropdownMenuEntry<ColorLabel>(
            value: color, label: color.label, enabled: color.label != 'Grey'),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              DropdownMenu<ColorLabel>(
                initialSelection: ColorLabel.green,
                controller: colorController,
                label: const Text('Groupe sanguin'),
                dropdownMenuEntries: colorEntries,
                onSelected: (ColorLabel? color) {
                  setState(() {
                    selectedColor = color;
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

enum ColorLabel {
  blue('A+', Colors.blue),
  red('A-', Colors.blue),
  kotkot('B+', Colors.blue),

  pink('B-', Colors.pink),
  green('AB+', Colors.green),
  white('AB-', Colors.green),

  yellow('O+', Colors.yellow),
  grey('O-', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}
