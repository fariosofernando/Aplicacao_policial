import 'package:police_app/src/components/register_individual_screen_widget.dart';
import 'package:police_app/src/screens/login_screen.dart';
import 'package:police_app/src/screens/presplash_screen.dart';

class NamedRoute {
  static const presplash = "/presplash";
  static const login = "/login";
  static const register = '/register';
}

class RouteHandler {
  static final routes = {
    NamedRoute.login: (_) => const LoginScreen(),
    NamedRoute.presplash: (_) => const PresplashScreen(),
    NamedRoute.register: (_) => const RegisterIndividualScreenWidget(),
  };
}
