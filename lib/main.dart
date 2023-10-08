import 'package:flutter/material.dart';
import 'package:staras_manager/view/Authentication/sign_in_hr.dart';
import 'package:staras_manager/view/SplashScreen/splash_screen.dart';
import 'package:face_camera/face_camera.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FaceCamera.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Add the line below to get horizontal sliding transitions for routes.
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      title: 'Staras',
      home: const SignInHr(),
    );
  }
}
