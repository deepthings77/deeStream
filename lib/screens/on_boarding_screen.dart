import 'package:flutter/material.dart';
import 'package:twitch/responsive/responsive.dart';
import 'package:twitch/screens/login_screen.dart';
import 'package:twitch/screens/sign_up_screen.dart';
import 'package:twitch/widgets/custom_button.dart';

class OnBoardingScreen extends StatelessWidget {
  static const routeName = '/onboading';
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                const Text(
                    'Welcome \n To \n DeeStream',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                            Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomButton(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreeen.routeName);
                      },
                      text: 'Log in',
                    ),
                  ),
                  CustomButton(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      text: 'Sign Up'),
            ],
          ),
        ),
      ),
    );
  }
}