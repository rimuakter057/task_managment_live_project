import 'package:flutter/material.dart';
import 'package:task_management_live_project/theme/text_field_theme.dart';
import 'package:task_management_live_project/view/screens/on_boarding_screens/email_verification/email_verification_screen.dart';
import 'package:task_management_live_project/view/screens/on_boarding_screens/login_screen/login_screen.dart';
import 'package:task_management_live_project/view/screens/on_boarding_screens/pin_verification_screen/pin_verification_screen.dart';
import 'package:task_management_live_project/view/screens/on_boarding_screens/registration_screen/registration_screen.dart';
import 'package:task_management_live_project/view/screens/on_boarding_screens/set_password_screen/set_password_screen.dart';
import 'package:task_management_live_project/view/screens/on_boarding_screens/splash_screen.dart';
class TaskManagement extends StatelessWidget {
  const TaskManagement({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
       initialRoute: LoginScreen.routeName,
       onGenerateRoute: (RouteSettings settings){
        late Widget widget;
        if(settings.name==SplashScreen.routeName){
          widget=SplashScreen();
        }else if(settings.name==LoginScreen.routeName){
          widget=LoginScreen();
        }else if(settings.name==RegistrationScreen.routeName){
          widget=RegistrationScreen();
        }else if(settings.name==PinVerificationScreen.routeName){
          widget=PinVerificationScreen();
        }else if(settings.name==SetPasswordScreen.routeName){
          widget=SetPasswordScreen();
        }else if(settings.name==EmailVerificationScreen.routeName){
          widget=EmailVerificationScreen();
        }else{
          widget=SplashScreen();
        }
        if(widget!=null){
          return MaterialPageRoute(builder: (context)=>widget);
        }else{
          return MaterialPageRoute(builder: (context)=>SplashScreen());
        }
       },
    );
  }
}