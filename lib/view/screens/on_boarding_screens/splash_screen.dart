import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management_live_project/utils/assets_path.dart';
import 'package:task_management_live_project/utils/colors.dart';

import '../../../utils/styles.dart';
import '../../widget/app_logo.dart';
import '../../widget/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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




