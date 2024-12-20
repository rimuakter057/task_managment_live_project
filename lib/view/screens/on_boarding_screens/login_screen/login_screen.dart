import 'package:flutter/material.dart';
import 'package:task_management_live_project/utils/colors.dart';

import '../../../../utils/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Get Started With",
                style: headTextStyle(),
              ),
              Text(
                "Learn With Ostad Platform",
                style: head2TextStyle(context: context),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .07,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: appButtonStyle(),
                    child: Text(
                      "Login",
                      style: buttonTextStyle(context: context),
                    )),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Forget Account",
                style: headTextStyle(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "you don't have an account?",
                    style: TextStyle(
                      fontSize: 14
                    ),
                  ),
                  TextButton(onPressed: (){},
                      child: Text("Sign up",style: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                      ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
