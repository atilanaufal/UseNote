import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/constant/routes.dart';

import 'package:get/get.dart';

import 'drawer_menu_item.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('DevBuild'),
                accountEmail: Text('DevBuild@gmail.com')),
            SizedBox(
              height: 10.0,
            ),
            DrawerMenuItem(
                title: 'All Notes', icon: Icons.note, onPressed: () {}),
            DrawerMenuItem(
              title: 'Settings',
              icon: Icons.settings,
              onPressed: () => Get.toNamed(Routes.settings),
            ),
          ],
        ),
      ),
    );
  }
}
