import 'package:flutter/material.dart';

class ManageTasksScreen extends StatefulWidget {
  const ManageTasksScreen({super.key});

  @override
  State<ManageTasksScreen> createState() => _ManageTasksScreenState();
}

class _ManageTasksScreenState extends State<ManageTasksScreen> {
  // Dummy list of tasks
  final List<Map<String, dynamic>> _tasks = [
    {'name': 'Buy groceries', 'completed': false},
    {'name': 'Finish Flutter project', 'completed': true},
    {'name': 'Call mom', 'completed': false},
    {'name': 'Read a book', 'completed': false},
    {'name': 'Workout for 30 mins', 'completed': true},
  ];

  String _searchQuery = '';

  // Function to delete a task
  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  // Function to toggle completion status
  void _toggleCompleted(int index) {
    setState(() {
      _tasks[index]['completed'] = !_tasks[index]['completed'];
    });
  }

  // Function to edit a task name
  void _editTask(int index) {
    TextEditingController editController =
        TextEditingController(text: _tasks[index]['name']);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Task'),
        content: TextField(
          controller: editController,
          decoration: const InputDecoration(
            hintText: 'Enter new task name',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _tasks[index]['name'] = editController.text;
              });
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filtered task list
    final filteredTasks = _tasks
        .where((task) =>
            task['name'].toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Tasks'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔍 Search Bar
            TextField(
              decoration: InputDecoration(
                labelText: 'Search tasks...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // 📋 Task List
            Expanded(
              child: filteredTasks.isEmpty
                  ? const Center(
                      child: Text(
                        'No tasks found.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredTasks.length,
                      itemBuilder: (context, index) {
                        final task = filteredTasks[index];
                        final originalIndex =
                            _tasks.indexOf(task); // Get original index

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            leading: Checkbox(
                              value: task['completed'],
                              onChanged: (value) {
                                _toggleCompleted(originalIndex);
                              },
                            ),
                            title: Text(
                              task['name'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                decoration: task['completed']
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.blueAccent),
                                  onPressed: () => _editTask(originalIndex),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.redAccent),
                                  onPressed: () => _deleteTask(originalIndex),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
