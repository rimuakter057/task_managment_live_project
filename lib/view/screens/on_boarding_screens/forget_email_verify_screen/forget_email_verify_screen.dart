import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/styles.dart';
import '../pin_verification_screen/pin_verification_screen.dart';
class ForgetEmailVerifyScreen extends StatefulWidget {
  const ForgetEmailVerifyScreen({super.key});

  static const routeName = '/forget-email-verify-screen';

  @override
  State<ForgetEmailVerifyScreen> createState() => _ForgetEmailVerifyScreenState();
}

class _ForgetEmailVerifyScreenState extends State<ForgetEmailVerifyScreen> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final mediumTitleStyle =Theme.of(context).textTheme.titleMedium;
        return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Text('Your Email Address', style: titleStyle),
              const SizedBox(height: 4),
              Text(
                'A 6 digits of OTP will be sent to your email address',
                style: mediumTitleStyle,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 40,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, PinVerificationScreen.routeName);
                },
                child: const Text(
                  "Continue",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _buildSignInSection(),
            ],
          ),
        ),
      ),
    );
  }
  // build sign in section
  RichText _buildSignInSection() {
    return RichText(text: TextSpan(
        text: "Already have an account?",
        style:Theme.of(context).textTheme.bodySmall,
        children: [
          TextSpan(
            text: "Sign In",
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
            recognizer: TapGestureRecognizer()..onTap = (){
              Navigator.pop(context);
            },
          ),
        ]
    ),
    );
  }
  // dispose

}
