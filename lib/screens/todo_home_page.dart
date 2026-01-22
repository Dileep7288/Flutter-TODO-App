import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';

class TodoHomePage extends StatefulWidget {
    const TodoHomePage({super.key});

    @override
    State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  final TextEditingController _controller = TextEditingController();
  final List<Task> _tasks = [];

  void _addTask() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _tasks.add(Task(title: _controller.text.trim()));
      _controller.clear();
    });
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index].isDone = !_tasks[index].isDone;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Input field
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter Task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),

          // Task list
          Expanded(
            child: _tasks.isEmpty
                ? const Center(child: Text('No tasks yet'))
                : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return TaskTile(
                  task: _tasks[index],
                  onToggle: () => _toggleTask(index),
                  onDelete: () => _deleteTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}