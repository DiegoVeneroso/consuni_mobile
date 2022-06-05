import 'package:consuni_mobile/app/core/constants/constants.dart';
import 'package:consuni_mobile/app/core/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CustomDrawer extends StatelessWidget {
  // AuthServices authServices = AuthServices();
  // int idUser;

  const CustomDrawer({Key? key}) : super(key: key);

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
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              _getStorage.read(Constants.USER_REP)
                  ? 'Representante'
                  : 'Representado',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: const FlutterLogo(),
          ),
          ListTile(
            leading: const Icon(
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
