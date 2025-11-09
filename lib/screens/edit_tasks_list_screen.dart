import 'package:flutter/material.dart';

class EditTasksListScreen extends StatefulWidget {
  const EditTasksListScreen({super.key});

  @override
  State<EditTasksListScreen> createState() => _EditTasksListScreenState();
}

class _EditTasksListScreenState extends State<EditTasksListScreen> {
  // Dummy list of tasks
  final List<Map<String, dynamic>> _tasks = [
    {'name': 'Buy groceries', 'completed': false},
    {'name': 'Finish Flutter project', 'completed': true},
    {'name': 'Call mom', 'completed': false},
    {'name': 'Read a book', 'completed': false},
    {'name': 'Workout for 30 mins', 'completed': true},
  ];

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter tasks based on the search query
    final filteredTasks = _tasks
        .where((task) =>
            task['name'].toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Tasks'),
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

            // 🧾 Task List
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
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
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
                            trailing: IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Editing "${task['name']}" (feature coming soon)'),
                                  ),
                                );
                              },
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
