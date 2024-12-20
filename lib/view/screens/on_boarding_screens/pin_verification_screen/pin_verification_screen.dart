
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../utils/styles.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  static const String routeName = '/pin-verification-screen';

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Text("Pin Verification",style: headTextStyle(),),
          Text("Learn With Ostad Platform",style: head2TextStyle(context:context),),
          SizedBox(height: 20,),
          PinCodeTextField(
            length: 6,
            pinTheme: appPinTheme(),
            obscureText: false,
            animationType: AnimationType.fade,
            animationDuration: Duration(milliseconds: 300),
            appContext: context,
            onChanged: (value){},
            onCompleted: (value){},
          )
        ],),
      ),
    );
  }
}
