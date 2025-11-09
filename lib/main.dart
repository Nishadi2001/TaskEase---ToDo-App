import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/task_provider.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(TaskEaseApp());
}

class TaskEaseApp extends StatelessWidget {
  const TaskEaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TaskEase',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
