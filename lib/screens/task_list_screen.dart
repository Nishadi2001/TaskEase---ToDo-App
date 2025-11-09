import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import 'edit_task_screen.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("My Tasks")),
      body: ListView.builder(
        itemCount: taskProvider.tasks.length,
        itemBuilder: (context, index) {
          final task = taskProvider.tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EditTaskScreen(task: task)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
