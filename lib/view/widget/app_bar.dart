import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      title: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.white,
          ),
          Expanded(
            child: Column(children: [
              Text("Ostad",style:textTheme.titleLarge?.copyWith(color: AppColors.white) ,),
              Text("ostad-batch eight",style:textTheme.bodySmall?.copyWith(color: AppColors.white) ,),
            ],),
          ),
          IconButton(onPressed: (){},
              icon:Icon(Icons.logout,color: AppColors.white,) ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}