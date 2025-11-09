import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;

  EditTaskScreen({super.key, required this.task});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController titleController;
  late TextEditingController descController;
  late TextEditingController categoryController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    descController = TextEditingController(text: widget.task.description);
    categoryController = TextEditingController(text: widget.task.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Task")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: titleController),
            TextField(controller: descController),
            TextField(controller: categoryController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedTask = Task(
                  id: widget.task.id,
                  title: titleController.text,
                  description: descController.text,
                  category: categoryController.text,
                  dateTime: widget.task.dateTime,
                );
                Provider.of<TaskProvider>(context, listen: false)
                    .editTask(widget.task.id, updatedTask);
                Navigator.pop(context);
              },
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
