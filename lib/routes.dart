import 'package:flutter_practice9/pages/home_page/home_page_body/home_page.dart';
import 'package:flutter_practice9/pages/login_page/login_page.dart';

class Routes {
  final routes = {
    "/LoginPage": (context) => const LoginPage(),
    "/HomePage": (context) => const HomePage(),
  };
}
