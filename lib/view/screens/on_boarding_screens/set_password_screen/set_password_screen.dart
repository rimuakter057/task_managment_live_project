import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management_live_project/view/screens/on_boarding_screens/signIn_screen/signIn_screen.dart';

import '../../../../utils/colors.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  static const routeName = '/set-password-screen';

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
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
              Text('Set Password', style: titleStyle),
              const SizedBox(height: 4),
              Text(
                'Minimum 6 characters',
                style: mediumTitleStyle,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Confirmed Password',
                ),
              ),
              const SizedBox(height: 40,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignInScreen.routeName);
                },
                child: const Text(
                  "Confirm",
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
/*  @override
  void dispose() {
    _emailController.dispose();
  }*/
}
