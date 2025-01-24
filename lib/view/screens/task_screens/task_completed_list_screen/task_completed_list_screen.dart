
import 'package:flutter/material.dart';

import '../../../../data/models/task_list/task_list_status_json_model.dart';
import '../../../../data/models/task_list/task_list_status_model.dart';
import '../../../../data/service/network_caller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/url.dart';
import '../../../widget/app_bar.dart';
import '../../../widget/snack_bar_message.dart';
import '../../../widget/task_item_widget.dart';
class TaskCompletedListScreen extends StatefulWidget {
  const TaskCompletedListScreen({super.key});
  static const routeName = '/task-cancel-list-screen';

  @override
  State<TaskCompletedListScreen> createState() => _TaskCancelListScreenState();
}

class _TaskCancelListScreenState extends State<TaskCompletedListScreen> {
  TaskListStatusModel? newListStatusModel;
  TaskModel taskModel = TaskModel();
  bool _getCompletedTaskListInProgress    = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSummaryCompletedList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Column(
        children: [

          Expanded(
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
                    status: 'Completed',
                    color: AppColors.green,
                    taskModel: taskModel,
                    onTap: () {
                      _deleteTask(newListStatusModel!.taskList![index].sId ?? '');
                      setState(() {

                      });
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
  // completed summary List api function
  Future<void> _getSummaryCompletedList() async {
    _getCompletedTaskListInProgress      = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.taskStatusList('Completed'));

    if(response.isSuccess){
      newListStatusModel =
          TaskListStatusModel.fromJson(response.responseData!);
      setState(() {

      });
    }else{
      showSnackBar(response.errorMessage, context);
    }
    _getCompletedTaskListInProgress   = false;
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