
import 'package:consuni_mobile/app/modules/auth/login/login_page.dart';
import 'package:get/route_manager.dart';

class AuthRouters {
  
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      page: () => const LoginPage(),
    ),
  ];
}