import 'package:flutter/material.dart';
import 'package:task_management_live_project/theme/theme_styles.dart';
import 'package:task_management_live_project/view/screens/on_boarding_screens/Signup_screen/signup_screen.dart';
import 'package:task_management_live_project/view/screens/on_boarding_screens/email_verification/email_verification_screen.dart';
import 'package:task_management_live_project/view/screens/on_boarding_screens/forget_email_verify_screen/forget_email_verify_screen.dart';
import 'package:task_management_live_project/view/screens/on_boarding_screens/pin_verification_screen/pin_verification_screen.dart';
import 'package:task_management_live_project/view/screens/on_boarding_screens/set_password_screen/set_password_screen.dart';
import 'package:task_management_live_project/view/screens/on_boarding_screens/signIn_screen/signIn_screen.dart';
import 'package:task_management_live_project/view/screens/on_boarding_screens/splash_screen.dart';

class TaskManagement extends StatelessWidget {
  const TaskManagement({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
        if (settings.name == SplashScreen.routeName) {
          widget = SplashScreen();
        } else if (settings.name == SignInScreen.routeName) {
          widget = SignInScreen();
        } else if (settings.name == SignUpScreen.routeName) {
          widget = SignUpScreen();
        } else if (settings.name == ForgetEmailVerifyScreen.routeName) {
          widget = ForgetEmailVerifyScreen();
        } else if (settings.name == PinVerificationScreen.routeName) {
          widget = PinVerificationScreen();
        } else if (settings.name == SetPasswordScreen.routeName) {
          widget = SetPasswordScreen();
        } else if (settings.name == EmailVerificationScreen.routeName) {
          widget = EmailVerificationScreen();
        } else {
          widget = SplashScreen(); // Default fallback route
        }
        return MaterialPageRoute(builder: (context) => widget);
      },
    );
  }
}




