import 'package:flutter/material.dart';
import 'package:task_management_live_project/data/models/task_list/task_list_status_model.dart';

import '../../data/service/network_caller.dart';
import '../../utils/colors.dart';
import '../../utils/url.dart';

class TaskItemWidget extends StatelessWidget {

  const TaskItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.status,
    required this.color,
    this.deleteIconColor,
    this.editIconColor, required this.taskModel, required this.taskId,required this.onTap,
  });
 final String taskId;
  final String title;
  final String subtitle;
  final String date;
  final String status;
  final Color color;
  final Color? deleteIconColor;
  final Color? editIconColor;
  final TaskModel taskModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskId,
              style: theme.textTheme.titleMedium,
            ),
            Text(
              title,
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subtitle,
              style: theme.textTheme.bodySmall,
            ),
            Text(
              date,
              style: theme.textTheme.bodySmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  side: BorderSide(color: AppColors.grey),
                  label: Text(
                    status,
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: Colors.white),
                  ),
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: editIconColor ?? AppColors.primaryColor,
                        )),
                    IconButton(
                        onPressed: onTap,
                        icon: Icon(
                          Icons.delete,
                          color: deleteIconColor ?? AppColors.black,
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}


