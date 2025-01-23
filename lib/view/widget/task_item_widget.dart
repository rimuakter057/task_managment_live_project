import 'package:flutter/material.dart';

import '../../utils/colors.dart';
class TaskItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String status;
  final Color color;
  final Color? deleteIconColor;
  final Color? editIconColor;
  const TaskItemWidget({
    super.key, required this.title, required this.subtitle, required this.date, required this.status, required this.color, this.deleteIconColor, this.editIconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      child: ListTile(
        title: Text(
          title,
          style: theme.textTheme.titleMedium,
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
                  side: BorderSide(
                      color: AppColors.grey
                  ),
                  label: Text(
                    status,
                    style: theme.textTheme.bodySmall!.copyWith(color: Colors.white),
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
                          color:editIconColor?? AppColors.primaryColor,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          color:deleteIconColor?? AppColors.black,
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


/*
class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 0,
      child: ListTile(
        title: Text("data"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("description data"),
            Text("date:13-1-2025"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Chip(label: Text("data")),
                Row(
                  children: [
                    IconButton(onPressed: (){},
                        icon:Icon(Icons.edit,color: AppColors.primaryColor,)),
                    IconButton(onPressed: (){},
                        icon:Icon(Icons.delete,color: AppColors.primaryColor,)),
                  ],
                ),
              ],)
          ],
        ),
      ),
    );
  }
}*/
