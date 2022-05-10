
import 'package:consuni_mobile/app/modules/auth/login/login_page.dart';
import 'package:consuni_mobile/app/modules/auth/login/register/register_page.dart';
import 'package:get/route_manager.dart';

class AuthRouters {
  
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      page: () => const LoginPage(),
    ),
    GetPage(
      name: '/auth/register',
      page: () => const RegisterPage(),
    ),
  ];
}