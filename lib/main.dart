import 'package:flutter/material.dart';

import 'core/routes/app_routers.dart';
import 'core/routes/page_route_name.dart';
import 'core/theme/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: ThemeManager.getLightTheme(),
      darkTheme: ThemeManager.getDarkTheme(),
      initialRoute: PageRouteName.singIn,
      onGenerateRoute: AppRouters.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
