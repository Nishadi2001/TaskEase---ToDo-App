import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'add_task_screen.dart';
import 'my_tasks_screen.dart';
import 'manage_tasks_screen.dart';
import 'edit_task_screen.dart';
import 'edit_tasks_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/profile.png'),
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            const Text(
              "Hello, John!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Good Morning",
              style: TextStyle(
                fontSize: 18,
                color: Colors.deepPurpleAccent,
              ),
            ),
            const SizedBox(height: 20),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Task Options
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildTaskBox("My Tasks", Icons.list, context, MyTasksScreen()),
                _buildTaskBox(
                    "Add a Task", Icons.add, context, AddTaskScreen()),
                _buildTaskBox("Manage Tasks", Icons.manage_accounts, context,
                    ManageTasksScreen()),
                _buildTaskBox("Edit Tasks", Icons.edit, context,
                    const EditTasksListScreen()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskBox(
      String title, IconData icon, BuildContext context, Widget page) {
    return InkWell(
      onTap: () {
        // Navigate to the corresponding page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        height: 120, // smaller height
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade100,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withAlpha((0.1 * 255).toInt()),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.deepPurple),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
