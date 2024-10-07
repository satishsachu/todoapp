import 'package:flutter/material.dart';
import 'components/dialog_box.dart';
import '/components/todo_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _controller = TextEditingController();
  List toDolist = [
    ["make comfortable", false],
    ["make comfortable", true],
    ["make comfortable", false],
    ["hi babe", true],
  ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDolist[index][1] = !toDolist[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDolist.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
  }

  void createTaskButton() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onsave: saveNewTask,
            oncancel: () => Navigator.of(context).pop(),
          );
        });
  }

// delete task
  void deleteTask(int index) {
    setState(() {
      toDolist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Todo delete App',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: createTaskButton,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        body: ListView.builder(
            itemCount: toDolist.length,
            itemBuilder: (context, index) {
              return TodoList(
                  taskname: toDolist[index][0],
                  taskcompleted: toDolist[index][1],
                  onchanged: (value) => checkboxChanged(value, index),
                  deleteFunction: (context) => deleteTask(index));
            }));
  }
}
