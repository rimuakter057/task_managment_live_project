import 'package:flutter/material.dart';
import 'package:task_management_live_project/view/screens/on_boarding_screens/signIn_screen/signIn_screen.dart';
import '../../widget/app_logo.dart';
import '../../widget/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // function to navigate to next screen
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      nextScreen(context);
    });
  }
  Future<void> nextScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, SignInScreen.routeName);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ScreenBackground(
        child:Center(
          child: AppLogo(),
        ) ,
        
      )
    );
  }
}




