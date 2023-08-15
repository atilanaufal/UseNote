import 'package:flutter/material.dart';

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem({Key? key, this.title, this.icon, this.onPressed})
      : super(key: key);
  final String? title;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      title: Text(title!),
      leading: Icon(icon),
      onTap: onPressed,
    );
  }
}
