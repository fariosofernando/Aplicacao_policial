import 'package:flutter/material.dart';
import 'package:police_app/src/route_handler.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Police Application Demo',
      themeMode: ThemeMode.dark,
      initialRoute: NamedRoute.presplash,
      routes: RouteHandler.routes,
    );
  }
}
