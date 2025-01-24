import 'package:flutter/material.dart';
import 'package:task_management_live_project/data/models/task_count/task_count_model.dart';
import 'package:task_management_live_project/data/models/task_list/task_list_status_json_model.dart';
import 'package:task_management_live_project/data/models/task_list/task_list_status_model.dart';
import 'package:task_management_live_project/data/service/network_caller.dart';
import 'package:task_management_live_project/view/widget/screen_background.dart';
import '../../../../data/models/task_count/task_count_json_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/url.dart';
import '../../../widget/app_bar.dart';
import '../../../widget/circular_indicator.dart';
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
  TaskListStatusModel? newListStatusModel;
  TaskCountStatusModel? taskCountStatusModel;

  TaskModel taskModel = TaskModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSummaryStatus();
    _getSummaryNewList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),

      body: ScreenBackground(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            _buildTaskSummaryStatus(),
            Visibility(
                visible: _getNewTaskListInProgress == false,
                replacement: const CircularIndicator(),
                child: _buildTaskListview())
          ],
        ),
      )),
    );
  }

  Expanded _buildTaskListview() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: newListStatusModel?.taskList?.length ?? 0,
          itemBuilder: (context, index) {
            return TaskItemWidget(
              title: taskModel.title ?? 'something wrong',
              subtitle: taskModel.description ?? 'something wrong',
              taskId: taskModel.sId ?? 'something wrong',
              date: taskModel.createdDate ?? 'something wrong',
              status: 'New',
              color: AppColors.blue,
              taskModel: newListStatusModel!.taskList![index],
              onTap: () {
                _deleteTask(newListStatusModel!.taskList![index].sId ?? '');
                setState(() {

                });
              },
            );
          }),
    );
  }

  // summary status ui
  Widget _buildTaskSummaryStatus() {
    return Visibility(
      visible: _getTaskCountStatusInProgress == false,
      replacement: CircularProgressIndicator(
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
              final TaskCountModel model =
                  taskCountStatusModel!.taskByStatusList![index];
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

  // get summary status api function
  Future<void> _getSummaryStatus() async {
    _getTaskCountStatusInProgress = true;
    setState(() {});
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.taskStatusCount);

    if (response.isSuccess) {
      taskCountStatusModel =
          TaskCountStatusModel.fromJson(response.responseData!);
      setState(() {});
    } else {
      showSnackBar(response.errorMessage, context);
    }
    _getTaskCountStatusInProgress = false;
    setState(() {});
  }

  // New summary List api function
  Future<void> _getSummaryNewList() async {
    _getNewTaskListInProgress = true;
    setState(() {});
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.taskStatusList('New'));

    if (response.isSuccess) {
      newListStatusModel = TaskListStatusModel.fromJson(response.responseData!);
      setState(() {});
    } else {
      showSnackBar(response.errorMessage, context);
    }
    _getNewTaskListInProgress = false;
    setState(() {});
  }

  // delete task api function
  Future<void> _deleteTask(String taskId) async {
    final NetworkResponse response =
    await NetworkCaller.getRequest(url: Urls.deleteTask(taskId));
    if (response.isSuccess) {
      debugPrint("success");
    }else{
      debugPrint("fail");
    }

  }

}
