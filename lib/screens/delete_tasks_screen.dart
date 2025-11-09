import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class DeleteTasksScreen extends StatelessWidget {
  const DeleteTasksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Delete Tasks")),
      body: ListView.builder(
        itemCount: taskProvider.tasks.length,
        itemBuilder: (context, index) {
          final task = taskProvider.tasks[index];
          return ListTile(
            title: Text(task.title),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                taskProvider.deleteTask(task.id);
              },
            ),
          );
        },
      ),
    );
  }
}
