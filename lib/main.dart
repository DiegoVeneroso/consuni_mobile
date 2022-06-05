import 'package:consuni_mobile/app/core/bindings/application_bindings.dart';
import 'package:consuni_mobile/app/core/ui/app_ui.dart';
import 'package:consuni_mobile/app/routes/additem_routers.dart';
import 'package:consuni_mobile/app/routes/auth_routers.dart';
import 'package:consuni_mobile/app/routes/edititem_routers.dart';
import 'package:consuni_mobile/app/routes/home_routers.dart';
import 'package:consuni_mobile/app/routes/itemdetail_routers.dart';
import 'package:consuni_mobile/app/routes/splash_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  await init();
  await GetStorage
      .init(); //todo o projeto que utilizar o GetStorage deve incluir isso no Main
  runApp(const MyApp());
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Consuni',
      theme: AppUI.theme,
      initialBinding: ApplicationBindings(),
      getPages: [
        ...SplashRoutes.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...AdditemRouters.routers,
        ...ItemDetailRouters.routers,
        ...EdititemRouters.routers
      ],
    );
  }
}
