import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/logger/logger.dart';
import 'package:mobile/screens/AuthChoiceScreen.dart';
import 'package:mobile/screens/RegisterScreen.dart';
import 'package:mobile/screens/login/LoginScreen.dart';
import 'package:mobile/screens/home_tab.dart';
import 'package:mobile/screens/main_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Preserve splash screen while initialization
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  logger.i('Starting Passkeys App...');


  // Remove splash screen after some delay
  Future.delayed(const Duration(milliseconds: 500), () {
    FlutterNativeSplash.remove();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return ScreenUtilInit(
      designSize:  Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AuthChoiceScreen(),
          routes: {
            '/register': (context) => RegisterScreen(),
            '/login': (context) => LoginScreen(),
            '/main_screen': (context) => MainScreen(),
          },
        );
      },
    );
  }
}
