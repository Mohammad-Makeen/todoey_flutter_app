import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/modules/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

//create a method for color generating,
// assign color to container > ListTile depending on the size
final Color colorGenerated =
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Consumer will listen to changes instead on provider
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            //to reduce redundancy
            final task = taskData.tasks[index];
            return Container(
              color: colorGenerated,
              child: TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (bool checkBoxState) {
                  taskData.updateTask(task);
                },
                longPressCallback: () {
                  taskData.deleteTask(
                      isTaskCheck: task.isDone, taskIndex: index);
                },
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
