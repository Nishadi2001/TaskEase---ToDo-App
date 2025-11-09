import 'package:flutter/material.dart';

class MyTasksScreen extends StatefulWidget {
  const MyTasksScreen({super.key});

  @override
  State<MyTasksScreen> createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends State<MyTasksScreen> {
  // Dummy list of tasks
  final List<String> tasks = [
    'Buy groceries',
    'Finish Flutter assignment',
    'Book doctor appointment',
    'Complete project report',
    'Go for evening walk'
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filtered list based on search query
    final filteredTasks = tasks
        .where((task) => task.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'My Tasks',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search tasks...',
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // Task List
            Expanded(
              child: filteredTasks.isEmpty
                  ? const Center(
                      child: Text(
                        'No tasks found.',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredTasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            leading: const Icon(Icons.task_alt,
                                color: Colors.indigo),
                            title: Text(
                              filteredTasks[index],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.edit, color: Colors.grey),
                              onPressed: () {
                                // Navigation to Edit Task Screen can be added here
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
