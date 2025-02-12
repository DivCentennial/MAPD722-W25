import 'package:flutter/material.dart';
import 'package:week6_todoapp/sqlHelper.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController _taskController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  List<Map<String, dynamic>> _tasks = [];
  int? _filter;

  void _fetchTasks() async {
    final tasks = await DatabaseHelper.instance.getTasks(_filter);
    setState(() {
      _tasks = tasks;
    });
  }

  void _addTask() async {
    if (_taskController.text.isNotEmpty) {
      await DatabaseHelper.instance.insertTask(
        _taskController.text,
        _selectedDate.toIso8601String(),
      );
      _taskController.clear();
      _fetchTasks();
    }
  }

  void _toggleCompletion(int id, int isCompleted) async {
    await DatabaseHelper.instance.updateTask(id, isCompleted == 0 ? 1 : 0);
    _fetchTasks();
  }

  void _deleteTask(int id) async {
    await DatabaseHelper.instance.deleteTask(id);
    _fetchTasks();
  }

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDo List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _taskController,
                  decoration: const InputDecoration(labelText: 'Enter Task'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    }
                  },
                  child: Text('Select Due Date: ${_selectedDate.toLocal()}'
                      .split(' ')[0]),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text('Add Task'),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _filter = null;
                  });
                  _fetchTasks();
                },
                child: const Text("All"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _filter = 1;
                  });
                  _fetchTasks();
                },
                child: const Text("Completed"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _filter = 0;
                  });
                  _fetchTasks();
                },
                child: const Text("Incomplete"),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  title: Text(task['title']),
                  subtitle: Text('Due: ${task['dueDate'].split('T')[0]}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: task['isCompleted'] == 1,
                        onChanged: (value) {
                          _toggleCompletion(task['id'], task['isCompleted']);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteTask(task['id']),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
