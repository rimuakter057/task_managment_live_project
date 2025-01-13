import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management_live_project/utils/colors.dart';
import 'package:task_management_live_project/view/screens/task_screens/nav_screen/nav_screen.dart';

import '../../../../utils/styles.dart';
import '../Signup_screen/signup_screen.dart';
import '../forget_email_verify_screen/forget_email_verify_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String routeName = '/signIn-screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final bodySmallStyle=Theme.of(context).textTheme.bodySmall;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Get Started With",
                  style:titleStyle,
                ),
                Text(
                  "Learn With Ostad Platform",
                  style: head2TextStyle(context: context),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, NavScreen.routeName);
                    },
                    child: const Text(
                      "Sign In",
                    ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, ForgetEmailVerifyScreen.routeName);
                },
                  child: Text("Forgot Password?",style: bodySmallStyle
                  ),
                ),
                buildSignUpSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  RichText buildSignUpSection() {
    return RichText(text: TextSpan(
              text: "you don't have an account?",
                style:Theme.of(context).textTheme.bodySmall,
              children: [
                TextSpan(
                  text: "Sign up",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = (){
                    Navigator.pushNamed(context, SignUpScreen.routeName);
                  },
                ),
              ]
    ),
    );
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
