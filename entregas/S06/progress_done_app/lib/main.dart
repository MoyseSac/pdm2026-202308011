import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Task {
  final String title;
  final String duration;
  final IconData icon;

  const Task({required this.title, required this.duration, required this.icon});
}

const tasks = [
  Task(title: 'Tarea', duration: '2 hrs', icon: Icons.assignment_outlined),
  Task(title: 'Gym', duration: '1 hr', icon: Icons.fitness_center),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Progress Done',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.lightGreen),
      home: const TuDiaScreen(),
    );
  }
}

class TuDiaScreen extends StatelessWidget {
  const TuDiaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tu día'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(child: Badge(label: Text('12'), child: Icon(Icons.calendar_today))),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  leading: Icon(task.icon),
                  title: Text(task.title),
                  subtitle: Text(task.duration),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () {},
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('AGREGAR'),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Hecho'),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Panel'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Alertas'),
        ],
      ),
    );
  }
}
