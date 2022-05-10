import 'package:consuni_mobile/app/core/ui/app_ui.dart';
import 'package:consuni_mobile/app/routes/auth_routers.dart';
import 'package:consuni_mobile/app/routes/splash_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return GetMaterialApp(
         title: 'Consuni',
         theme: AppUI.theme,
         getPages: [
          ...SplashRoutes.routers,
          ...AuthRouters.routers,
         ],
       );
  }
}

