import 'package:flutter/material.dart';
import 'package:task_management_live_project/utils/colors.dart';
import 'package:task_management_live_project/view/widget/screen_background.dart';
import '../../../widget/app_bar.dart';
import '../../../widget/task_item_widget.dart';
import '../../../widget/task_summary_widget.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});
  static const routeName = '/new-task-list-screen';

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
     appBar: const AppBarWidget(),
      body: ScreenBackground(child: Column(children: [
        _buildTaskSummaryStatus(),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
              primary: false,
              itemCount: 20,
              itemBuilder: (context,index){
              return TaskItemWidget();
          }),
        )
        
        
      ],)),
    );
  }

  
  
  
  
  
  
  
  
  
  
  
 Widget _buildTaskSummaryStatus() {
    return const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            TaskStatusSummaryCounterWidget(
              title: 'New',
              count: '12',
            ),
            TaskStatusSummaryCounterWidget(
              title: 'Progress',
              count: '12',
            ),
            TaskStatusSummaryCounterWidget(
              title: 'Completed',
              count: '12',
            ),
            TaskStatusSummaryCounterWidget(
              title: 'Cancelled',
              count: '12',
            ),
          ],),
        ),
      );
  }
}






