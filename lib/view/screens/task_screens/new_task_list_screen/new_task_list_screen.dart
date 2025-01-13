
import 'package:flutter/material.dart';
import 'package:task_management_live_project/theme/theme_styles.dart';
import 'package:task_management_live_project/utils/colors.dart';
import 'package:task_management_live_project/view/widget/screen_background.dart';

import '../../../widget/app_bar.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});
  static const routeName = '/new-task-list-screen';

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {

  @override
  Widget build(BuildContext context) {
    var  textTheme= Theme.of(context).textTheme;
    return Scaffold(
     appBar: AppBarWidget(textTheme: textTheme),
      body: ScreenBackground(child: Column(children: [
        Row(children: [
          Card(
            color: AppColors.white,
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: Column(children: [
                      Text("01",style: textTheme.titleLarge,),
                Text("text",style:textTheme.titleSmall,),

              ],),
            )
          ),
        ],)
      ],)),
    );
  }
}


