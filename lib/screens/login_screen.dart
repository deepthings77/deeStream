import 'package:flutter/material.dart';
import 'package:twitch/resources/auth_methods.dart';
import 'package:twitch/screens/home_screen.dart';
import 'package:twitch/widgets/custom_button.dart';
import 'package:twitch/widgets/custom_textfield.dart';
import 'package:twitch/widgets/loading_indicator.dart';

class LoginScreeen extends StatefulWidget {
  static const routeName = '/loginRoute';
  const LoginScreeen({super.key});

  @override
  State<LoginScreeen> createState() => _LoginScreeenState();
}

class _LoginScreeenState extends State<LoginScreeen> {
    final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
   final AuthMethods _authMethods = AuthMethods();
   bool _isLoading = false;

   loginUser() async {
       setState(() {
      _isLoading = true;
    });
    bool res = await _authMethods.loginUser(
      context,
      _emailController.text,
      _passwordController.text,
    );
    setState(() {
      _isLoading = false;
    });
    if (res) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }
    @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
            appBar: AppBar(
        title: const Text(
          'Sign Up',
        ),
      ),
      body: _isLoading
          ? const LoadingIndicator()
          : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.1),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextField(
                          controller: _emailController,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                                         
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextField(
                          controller: _passwordController,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(onTap: loginUser, text: 'Login'),
                    ],
                  ),
                ),
              ),
    );
  }
}