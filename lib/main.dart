import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quillai/constants/app_theme.dart';
import 'package:quillai/firebase_options.dart';
import 'package:quillai/routes/app_routes.dart';
import 'package:quillai/utils/app_bindings.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> determineInitialRoute() async {
  User? user = FirebaseAuth.instance.currentUser;
  return user != null ? AppRoutes.dashboardScreen : AppRoutes.splashScreen;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    String initialRoute = await determineInitialRoute();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLanguage = prefs.getString('language') ?? 'en';

    runApp(App(
      initialRoute: initialRoute,
      savedLanguage: savedLanguage,
    ));
  } catch (e) {
    debugPrint("Error initializing app: $e");
  }
}

class App extends StatelessWidget {
  final String initialRoute;
  final String? savedLanguage;

  const App({
    Key? key,
    required this.initialRoute,
    required this.savedLanguage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale(savedLanguage!),
      fallbackLocale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: initialRoute,
      getPages: AppRoutes.pages,
      defaultTransition: Transition.fade,
      initialBinding: AppBinding(),
    );
  }
}
