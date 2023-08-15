import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/screens/home_screen/widgets/bottom_menu/bottom_menu.dart';

class OpenBottomMenuButton extends StatelessWidget {
  const OpenBottomMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.widgets_rounded),
      onPressed: () =>
          // showDialog(context: context, builder: (context) => BottomMenu())
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              context: context,
              builder: (context) => BottomMenu()),
    );
  }
}
