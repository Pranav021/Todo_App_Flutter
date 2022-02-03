import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: Provider.of<TaskData>(context).tasks[index].name,
            isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
            checkboxCallback: (checkboxState) {
              Provider.of<TaskData>(context, listen: false).updateTask(
                  Provider.of<TaskData>(context, listen: false).tasks[index]);
            },
            longPressCallback: () {
              Provider.of<TaskData>(context, listen: false).deleteTask(
                  Provider.of<TaskData>(context, listen: false).tasks[index]);
            });
      },
      itemCount: Provider.of<TaskData>(context).tasks.length,
    );
  }
}
