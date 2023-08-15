import 'package:flutter/material.dart';

class ToolsButton extends StatelessWidget {
  const ToolsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: ToggleButtons(
        isSelected: [false, false, false, false, false, false],
        children: [
          IconButton(icon: Icon(Icons.format_bold), onPressed: () {}),
          IconButton(icon: Icon(Icons.format_italic), onPressed: () {}),
          IconButton(icon: Icon(Icons.format_underline), onPressed: () {}),
          IconButton(icon: Icon(Icons.format_align_left), onPressed: () {}),
          IconButton(icon: Icon(Icons.format_align_center), onPressed: () {}),
          IconButton(icon: Icon(Icons.format_align_right), onPressed: () {})
        ],
      ),
    );
  }
}
