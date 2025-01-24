
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../data/service/network_caller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/styles.dart';
import '../../../../utils/url.dart';
import '../set_password_screen/set_password_screen.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key,  this.email});
final String? email ;


  static const String routeName = '/pin-verification-screen';

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
TextEditingController _otpController = TextEditingController();
  String otpValue = "";

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
            controller:_otpController ,
            keyboardType: TextInputType.number,
            length: 6,
            pinTheme: appPinTheme(),
            backgroundColor: Colors.transparent,
            appContext: context,
            onChanged: (pin){
              otpValue = pin;
              print("OTP পরিবর্তিত: $otpValue");
            },

          ),
          const SizedBox(height: 40,),
          ElevatedButton(
            onPressed: () {
              if (otpValue.length == 6) {
               //_recoverVerifyOtp(emailController.text, _otpController.text.toInt(), )
                Navigator.pushNamed(context, SetPasswordScreen.routeName);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please enter a 6-digit OTP")),
                );
              }
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
              print("Success");
              //Navigator.pop(context);
            },
          ),
        ]
    ),
    );
  }
  // recover verify send email

  Future<void> _recoverVerifyOtp(TextEditingController email,int otp) async {
    final String otp = _otpController.text.trim();
    final String? email = widget.email;
    final Map emailAndOtp = {"email":email,"otp":otp};
    final NetworkResponse response =
    await NetworkCaller.getRequest(url: Urls.recoverVerifyOtp(email!,otp.toString()));
    if (response.isSuccess) {
      debugPrint("success");
    }else{
      debugPrint("fail");
    }
  }
}

