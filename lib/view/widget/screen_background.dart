import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/assets_path.dart';

class ScreenBackground extends StatelessWidget {
  final Widget child;
  const ScreenBackground({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SvgPicture.asset(AssetPath.background,
        height: double.maxFinite,
        width:double.maxFinite,
        fit: BoxFit.cover,
      ),
        child
    ],);
  }
}