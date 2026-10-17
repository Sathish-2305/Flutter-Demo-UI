import 'package:flutter/material.dart';

void main() {
  runApp(const LearningApp());
}

class LearningApp extends StatelessWidget {
  const LearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learning App',
      theme: ThemeData(colorSchemeSeed: Colors.deepPurple, useMaterial3: true),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    CoursesPage(),
    MyLearningPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Courses',
          ),
          NavigationDestination(
            icon: Icon(Icons.play_circle_outline),
            selectedIcon: Icon(Icons.play_circle),
            label: 'My Learning',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// HOME PAGE
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Learning',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Hello, Sathish! 👋',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('What would you like to learn today?'),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.school, color: Colors.white, size: 42),
                SizedBox(height: 15),
                Text(
                  'Start Your Coding Journey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Learn something new every day.',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Popular Courses',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const CourseCard(
            title: 'Flutter Development',
            subtitle: 'Build apps using Flutter and Dart',
            icon: Icons.phone_android,
            color: Colors.blue,
          ),
          const CourseCard(
            title: 'Python Programming',
            subtitle: 'Learn Python from the basics',
            icon: Icons.code,
            color: Colors.green,
          ),
          const CourseCard(
            title: 'Web Development',
            subtitle: 'Learn HTML, CSS and JavaScript',
            icon: Icons.web,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

// COURSES PAGE
class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Courses')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text(
            'Explore Courses',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Choose a course to start learning.'),
          SizedBox(height: 20),
          CourseCard(
            title: 'Flutter Development',
            subtitle: '12 lessons • Beginner',
            icon: Icons.phone_android,
            color: Colors.blue,
          ),
          CourseCard(
            title: 'Python Programming',
            subtitle: '15 lessons • Beginner',
            icon: Icons.terminal,
            color: Colors.green,
          ),
          CourseCard(
            title: 'Web Development',
            subtitle: '10 lessons • Beginner',
            icon: Icons.language,
            color: Colors.orange,
          ),
          CourseCard(
            title: 'UI/UX Design',
            subtitle: '8 lessons • Beginner',
            icon: Icons.design_services,
            color: Colors.pink,
          ),
          CourseCard(
            title: 'Database Basics',
            subtitle: '6 lessons • Beginner',
            icon: Icons.storage,
            color: Colors.teal,
          ),
        ],
      ),
    );
  }
}

// MY LEARNING PAGE
class MyLearningPage extends StatelessWidget {
  const MyLearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Learning')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Your Progress',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Keep going! You are building new skills.'),
          const SizedBox(height: 25),
          progressCard('Flutter Development', 0.35, Colors.blue),
          progressCard('Python Programming', 0.60, Colors.green),
          progressCard('Web Development', 0.15, Colors.orange),
          const SizedBox(height: 20),
          const Card(
            child: ListTile(
              leading: Icon(Icons.emoji_events, color: Colors.amber, size: 35),
              title: Text('Learning Goal'),
              subtitle: Text('Complete one lesson every day.'),
            ),
          ),
        ],
      ),
    );
  }

  Widget progressCard(String title, double progress, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              color: color,
              backgroundColor: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            const SizedBox(height: 8),
            Text('${(progress * 100).round()}% completed'),
          ],
        ),
      ),
    );
  }
}

// PROFILE PAGE
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 48,
            backgroundColor: Color(0xFFE9DFFF),
            child: Icon(Icons.person, size: 55, color: Colors.deepPurple),
          ),
          const SizedBox(height: 16),
          const Text(
            'Developer',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            'learner@example.com',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 30),
          const ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Edit Profile'),
            trailing: Icon(Icons.chevron_right),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text('Notifications'),
            trailing: Icon(Icons.chevron_right),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('Settings'),
            trailing: Icon(Icons.chevron_right),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About App'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'My Learning',
                applicationVersion: '1.0.0',
                applicationLegalese: 'A beginner learning project.',
              );
            },
          ),
        ],
      ),
    );
  }
}

// REUSABLE COURSE CARD
class CourseCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const CourseCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(14),
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('$title selected')));
        },
      ),
    );
  }
}
