import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;

  const AppBarButton({
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPress, icon: Icon(icon, color: Colors.grey,));
  }
}