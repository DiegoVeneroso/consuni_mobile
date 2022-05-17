import 'package:consuni_mobile/app/core/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            // <-- SEE HERE
            decoration: BoxDecoration(color: const Color(0xff764abc)),
            accountName: Text(
              "Pinkesh Darji",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "pinkesh.earth@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: FlutterLogo(),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('Page 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.train,
            ),
            title: const Text('Sair'),
            onTap: () {
              Get.find<AuthServices>().logout();
            },
          ),
        ],
      ),
    );
  }
}
