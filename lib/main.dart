import 'package:flutter/material.dart';
import 'core/routes/app_routers.dart';
import 'core/routes/page_route_name.dart';
import 'core/theme/theme_manager.dart';
import 'core/services/local_storage_keys.dart';
import 'core/services/local_storage_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorageServices.init();
  var isFirstTime =
      LocalStorageServices.getBool(LocalStorageKeys.firstTime) ?? true;

  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;
  const MyApp({super.key, required this.isFirstTime});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: ThemeManager.getLightTheme(),
      darkTheme: ThemeManager.getDarkTheme(),
      initialRoute: isFirstTime ? PageRouteName.onboardingScreen : PageRouteName.singIn,
      onGenerateRoute: AppRouters.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
