
import 'package:consuni_mobile/app/modules/splash/splash_page.dart';
import 'package:get/route_manager.dart';

class SplashRoutes {
  
  SplashRoutes._();

  static final routers = <GetPage>[
    GetPage(name: '/', page: () => const SplashPage(),)
  ];
}