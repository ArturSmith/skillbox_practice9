import 'package:flutter_practice9/home_page/home_main_page.dart';
import 'package:flutter_practice9/login_page/login_page.dart';

class Routes {
  final routes = {
    "/LoginPage": (context) => const LoginPage(),
    "/HomeMainPage": (context) => HomeMainPage()
  };
}
