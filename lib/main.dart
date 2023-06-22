import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_medication_app/screens/add_medication_screen.dart';
import 'package:smart_medication_app/screens/calendar_screen.dart';
import 'package:smart_medication_app/screens/confirmation_email_screen.dart';
import 'package:smart_medication_app/screens/forgot_password.dart';
import 'package:smart_medication_app/screens/home_screen.dart';
import 'package:smart_medication_app/screens/landing_screen.dart';
import 'package:smart_medication_app/screens/login_screen.dart';
import 'package:smart_medication_app/screens/profile_screen.dart';
import 'package:smart_medication_app/screens/register_screen.dart';
import 'package:smart_medication_app/screens/setting_screen.dart';
import 'constants/firebase.dart';
import 'controllers/home_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value){
    var getIt = GetIt.I;
    getIt.registerLazySingleton<HomeController>(() => HomeController());
  });

  String intialRoute = "/login";
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool firstLogin = prefs.getBool('first_login') ?? true;

  if(firstLogin){
    intialRoute = "/landing";
  }

  runApp(MaterialApp(
    title: 'Smart Medication',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.deepPurple,
    ),
    initialRoute: intialRoute,
    routes: {
      "/login": (context) => const LoginScreen(),
      "/register": (context) => const RegisterScreen(),
      "/profile": (context)=> const ProfileScreen(),
      "/landing": (context)=>LandingScreen(),
      "/confirmation-mail": (context)=>const EmailVerifyScreen(),
      "/calender": (context)=>const CalendarScreen(),
      "/settings": (context)=>const SettingScreen(),
      "/add-medication": (context)=> AddMedicationScreen(),
      "/home": (context)=> const HomeScreen(),
      "/forgotpass": (context)=>ForgotPasswordScreen(),
    },

  ));
}

