
import 'package:flutter/material.dart';

import '../../../../data/models/task_list/task_list_status_json_model.dart';
import '../../../../data/models/task_list/task_list_status_model.dart';
import '../../../../data/service/network_caller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/url.dart';
import '../../../widget/app_bar.dart';
import '../../../widget/snack_bar_message.dart';
import '../../../widget/task_item_widget.dart';

class TaskCancelListScreen extends StatefulWidget {
  const TaskCancelListScreen({super.key});
  static const routeName = '/task-cancel-list-screen';

  @override
  State<TaskCancelListScreen> createState() => _TaskCancelListScreenState();
}

class _TaskCancelListScreenState extends State<TaskCancelListScreen> {
  TaskListStatusModel? newListStatusModel;
  TaskModel taskModel = TaskModel();
  bool _getCancelledTaskListInProgress   = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSummaryCancelledList();
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
                    status: 'Cancelled',
                    color: AppColors.primaryColor, taskModel: taskModel,
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
  // cancelled summary List api function
  Future<void> _getSummaryCancelledList() async {
    _getCancelledTaskListInProgress     = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.taskStatusList('Cancelled'));

    if(response.isSuccess){
      newListStatusModel =
          TaskListStatusModel.fromJson(response.responseData!);
      setState(() {

      });
    }else{
      showSnackBar(response.errorMessage, context);
    }
    _getCancelledTaskListInProgress   = false;
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
