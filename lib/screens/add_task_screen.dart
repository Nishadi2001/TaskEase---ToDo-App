import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  String selectedCategory = 'Work';
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final List<String> categories = ['Work', 'Personal', 'Study', 'Other'];

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Task Title
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Task Title",
                prefixIcon: Icon(Icons.title),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Description
            TextField(
              controller: descController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Description",
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Category Dropdown
            InputDecorator(
              decoration: const InputDecoration(
                labelText: "Category",
                prefixIcon: Icon(Icons.category),
                border: OutlineInputBorder(),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedCategory,
                  isExpanded: true,
                  items: categories
                      .map((cat) => DropdownMenuItem(
                            value: cat,
                            child: Text(cat),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Date Picker
            TextField(
              readOnly: true,
              onTap: _pickDate,
              decoration: InputDecoration(
                labelText: selectedDate == null
                    ? "Select Date"
                    : DateFormat.yMMMd().format(selectedDate!),
                prefixIcon: const Icon(Icons.calendar_today),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Time Picker
            TextField(
              readOnly: true,
              onTap: _pickTime,
              decoration: InputDecoration(
                labelText: selectedTime == null
                    ? "Select Time"
                    : selectedTime!.format(context),
                prefixIcon: const Icon(Icons.access_time),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    if (titleController.text.isEmpty ||
                        selectedDate == null ||
                        selectedTime == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please fill all required fields"),
                        ),
                      );
                      return;
                    }

                    final dateTime = DateTime(
                      selectedDate!.year,
                      selectedDate!.month,
                      selectedDate!.day,
                      selectedTime!.hour,
                      selectedTime!.minute,
                    );

                    final newTask = Task(
                      id: const Uuid().v4(),
                      title: titleController.text,
                      description: descController.text,
                      category: selectedCategory,
                      dateTime: dateTime,
                    );

                    Provider.of<TaskProvider>(context, listen: false)
                        .addTask(newTask);

                    Navigator.pop(context);
                  },
                  child: const Text("Create"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
