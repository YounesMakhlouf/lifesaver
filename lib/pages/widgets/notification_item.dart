import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String message;
  final IconData? icon;

  const NotificationItem({
    super.key,
    required this.message,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: icon != null ? Icon(icon, color: Colors.red) : null,
        title: Text(
          message,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
