import 'package:flutter/material.dart';
import 'package:task_management_live_project/data/models/task_count/task_count_model.dart';
import 'package:task_management_live_project/data/service/network_caller.dart';
import 'package:task_management_live_project/view/widget/screen_background.dart';
import '../../../../data/models/task_count/task_count_json_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/url.dart';
import '../../../widget/app_bar.dart';
import '../../../widget/snack_bar_message.dart';
import '../../../widget/task_item_widget.dart';
import '../../../widget/task_summary_widget.dart';
import '../add_new_task_screen/add_new_task_screen.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});
  static const routeName = '/new-task-list-screen';

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  bool _getTaskCountStatusInProgress = false;
  bool _getNewTaskListInProgress = false;
  TaskCountStatusModel ? taskCountStatusModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSummaryStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AddNewTaskScreen.routeName,
          );
        },
        child: Icon(Icons.add),
      ),
      body: ScreenBackground(
          child: Column(
        children: [
          _buildTaskSummaryStatus(),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return TaskItemWidget();
                }),
          )
        ],
      )),
    );
  }

  // summary status
  Widget _buildTaskSummaryStatus() {
    return Visibility(
      visible: _getTaskCountStatusInProgress == false,
      replacement:  CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: taskCountStatusModel?.taskByStatusList?.length ?? 0,
            itemBuilder: (context, index) {
              final TaskCountModel model =taskCountStatusModel!.taskByStatusList![index];
              return TaskStatusSummaryCounterWidget(
                title: model.sId ?? '',
                count: model.sum.toString(),
              );
            },
          ),
        ),
      ),
    );
  }

  // get summary status
  Future<void> _getSummaryStatus() async {
    _getTaskCountStatusInProgress  = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.taskStatusCount);

    if(response.isSuccess){
      taskCountStatusModel =
          TaskCountStatusModel.fromJson(response.responseData!);
      setState(() {

      });
    }else{
       showSnackBar(response.errorMessage, context);
    }
    _getTaskCountStatusInProgress  = false;
    setState(() {});
  }



}
