import 'package:flutter/material.dart';

import '../../utils/colors.dart';

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
                Chip(label: Text("data")),
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
}