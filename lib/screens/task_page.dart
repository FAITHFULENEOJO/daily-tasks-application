import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:daily_planner/models/task.dart';


class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  double? _deviceHeight, _deviceWidth;
  String? content;
  Box? _box;


  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _deviceHeight! * 0.1,
        title: const Text("Daily Tasks", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.brown,
      ),
      body: _taskWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: displayTaskPop,
        backgroundColor: Colors.brown,
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }


  Widget _todolist() {

    List tasks = _box!.values.toList();
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          var task = Task.fromMap(tasks[index]);
          return ListTile(
            title: Text(task.todo),
            subtitle: Text(task.timeStamp.toString()),
            trailing: task.done ?
            Icon(Icons.check_box_outlined, color: Colors.brown,) :
            Icon(Icons.check_box_outline_blank),
            onTap: () {
              task.done = !task.done;
              _box!.putAt(index, task.toMap());
              setState(() {

              });
            },
            onLongPress: () {
              _box!.deleteAt(index);
              setState(() {});
            },
          );
        });
  }

  Widget _taskWidget() {
    return FutureBuilder(future: Hive.openBox("tasks"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            _box = snapshot.data;
            return _todolist();
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        });
  }

  void displayTaskPop() {
    showDialog(context: context, builder: (BuildContext _context) {
      return AlertDialog(
        title: const Text("Add a todo"),
        content: TextField(
          onSubmitted: (value) {
            if (content != null) {
              var task = Task(todo: content!, timeStamp: DateTime.now(), done: false);
              _box!.add(task.toMap());

              setState(() {
                print(value);
                Navigator.pop(context);
              });
            }
          },
          onChanged: (value) {
            setState(() {
              content = value;
              print(value);
            });
          },
        ),
      );
    });
  }
}
