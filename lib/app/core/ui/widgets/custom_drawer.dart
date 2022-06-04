import 'package:consuni_mobile/app/core/constants/constants.dart';
import 'package:consuni_mobile/app/core/services/auth_services.dart';
import 'package:consuni_mobile/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CustomDrawer extends StatelessWidget {
  // AuthServices authServices = AuthServices();
  // int idUser;

  CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _getStorage = GetStorage();

    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            // <-- SEE HERE
            decoration: BoxDecoration(color: const Color(0xff764abc)),
            accountName: Text(
              _getStorage.read(Constants.USER_NAME).toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              _getStorage.read(Constants.USER_EMAIL).toString(),
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
