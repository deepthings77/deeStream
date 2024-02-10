import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitch/providers/user_provider.dart';
import 'package:twitch/screens/home_screen.dart';
import 'package:twitch/screens/login_screen.dart';
import 'package:twitch/screens/on_boarding_screen.dart';
import 'package:twitch/screens/sign_up_screen.dart';
import 'package:twitch/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeeStream',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: backgroundColor,
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: const IconThemeData(
            color: primaryColor,
          ),
        ),
      ),
      routes: {
        OnBoardingScreen.routeName :(context) =>const OnBoardingScreen(),
        LoginScreeen.routeName :(context) => const LoginScreeen(),
        SignUpScreen.routeName :(context) => const SignUpScreen(),
        HomeScreen.routeName :(context) => const HomeScreen(),
      },
      home: const OnBoardingScreen(),
     );
  }
}