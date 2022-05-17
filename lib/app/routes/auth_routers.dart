import 'package:consuni_mobile/app/modules/auth/login/login_bindings.dart';
import 'package:consuni_mobile/app/modules/auth/login/login_page.dart';
import 'package:consuni_mobile/app/modules/auth/register/register_bindings.dart';
import 'package:consuni_mobile/app/modules/auth/register/register_page.dart';
import 'package:get/route_manager.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      binding: LoginBindings(),
      name: '/auth/login',
      page: () => const LoginPage(),
    ),
    GetPage(
      name: '/auth/register',
      binding: RegisterBindings(),
      page: () => const RegisterPage(),
    ),
  ];
}
