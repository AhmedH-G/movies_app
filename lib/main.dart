import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:toastification/toastification.dart';
import 'core/routes/app_routers.dart';
import 'core/routes/page_route_name.dart';
import 'core/services/loading_service.dart';
import 'core/theme/theme_manager.dart';
import 'core/services/local_storage_keys.dart';
import 'core/services/local_storage_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await LocalStorageServices.init();
  var isFirstTime =
      LocalStorageServices.getBool(LocalStorageKeys.firstTime) ?? true;

  runApp(MyApp(isFirstTime: isFirstTime));
  configloading();
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;
  const MyApp({super.key, required this.isFirstTime});


  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        theme: ThemeManager.getLightTheme(),
        darkTheme: ThemeManager.getDarkTheme(),
        initialRoute: isFirstTime ? PageRouteName.onboardingScreen : PageRouteName.singIn,
        onGenerateRoute: AppRouters.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
      ),
    );
  }
}
