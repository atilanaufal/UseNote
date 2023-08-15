import 'package:flutter/material.dart';

class BottomMenuItem extends StatelessWidget {
  const BottomMenuItem({Key? key, this.title, this.icon, this.onPressed})
      : super(key: key);
  final String? title;
  final IconData? icon;
  final VoidCallback? onPressed;

  final double? size = 30;
  final Color? color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: size,
            color: color,
          ),
          Text(
            title!,
            style: TextStyle(color: color, fontSize: size! / 2),
          )
        ],
      ),
      onTap: onPressed,
    );
  }
}
