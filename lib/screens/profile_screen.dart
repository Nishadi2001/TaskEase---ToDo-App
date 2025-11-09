import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.deepPurple.shade50,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Hello, John!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              // const SizedBox(height: 4),
              // const Text(
              //   "Good Morning.",
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: Colors.deepPurpleAccent,
              //   ),
              // ),
              // const SizedBox(height: 15),

              // Profile Picture
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile.png'),
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 15),

              // Name & Email
              const Text(
                "John Perera",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "johnp@gmail.com",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),

              // Profile Section
              const Text(
                "Profile Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 10),

              // Profile Info
              Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    ProfileRow(
                      icon: Icons.phone,
                      title: "Phone",
                      value: "+94 77 123 4567",
                    ),
                    Divider(),
                    ProfileRow(
                      icon: Icons.location_on,
                      title: "Location",
                      value: "Colombo",
                    ),
                    Divider(),
                    ProfileRow(
                      icon: Icons.calendar_today,
                      title: "Joined",
                      value: "Oct 2024",
                    ),
                    Divider(),
                    ProfileRow(
                      icon: Icons.work_outline,
                      title: "Occupation",
                      value: "Student",
                    ),
                    Divider(),
                    ProfileRow(
                      icon: Icons.favorite,
                      title: "Interests",
                      value: "AI, Flutter",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepPurple, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
