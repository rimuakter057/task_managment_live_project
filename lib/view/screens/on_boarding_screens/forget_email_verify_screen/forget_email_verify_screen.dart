import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management_live_project/data/service/network_caller.dart';
import 'package:task_management_live_project/utils/app_text.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/styles.dart';
import '../../../../utils/url.dart';
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
                decoration:  const InputDecoration(
                  hintText: AppTexts.emailHint,
                ),
                validator: (String? value) {
                  if(value?.trim().isEmpty??true){
                    return "email can't be empty";
                  }return null;
                },
              ),
              const SizedBox(height: 40,),
              ElevatedButton(
                onPressed: () {
                  _recoverVerifyEmail(_emailController.text);
                  Navigator.pushNamed(context, PinVerificationScreen.routeName,
                    arguments: {

                    },
                  );
                },
                child:  const Text(
                  AppTexts.continueT,
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

  // recover verify send email

  Future<void> _recoverVerifyEmail(String email) async {
    final NetworkResponse response =
    await NetworkCaller.getRequest(url: Urls.recoverVerifyEmail(email));
    if (response.isSuccess) {
      debugPrint("success");
    }else{
      debugPrint("fail");
    }
  }
}
