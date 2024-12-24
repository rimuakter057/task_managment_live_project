
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/styles.dart';
import '../set_password_screen/set_password_screen.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  static const String routeName = '/pin-verification-screen';

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final mediumTitleStyle =Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const SizedBox(height: 80),
          Text('Pin Verification', style: titleStyle),
          const SizedBox(height: 4),
          Text(
            'Minimum 6 characters',
            style: mediumTitleStyle,
          ),
          const SizedBox(height: 15),
          const SizedBox(height: 20,),
          PinCodeTextField(
            length: 6,
            pinTheme: appPinTheme(),
            obscureText: false,
            animationType: AnimationType.fade,
            animationDuration: Duration(milliseconds: 300),
            appContext: context,
            onChanged: (value){},
            onCompleted: (value){},
          ),
          const SizedBox(height: 40,),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, SetPasswordScreen.routeName);
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
