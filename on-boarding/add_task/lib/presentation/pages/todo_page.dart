import 'package:add_task/presentation/pages/Task_page.dart';
import 'package:add_task/presentation/pages/create_task_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/task.dart';

class TodoPage extends StatefulWidget {
  static const String routeName = '/todo';

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Task> items = [];

  Color determineCardColor(Task task) {
    if (task.done) {
      return Color.fromARGB(255, 239, 255, 240);
    }
    return Color.fromARGB(255, 248, 248, 248);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Image.asset(
                  'assets/images/stickman-with-todo-list.png')), //<a href="https://iconscout.com/illustrations/stickman" target="_blank">Free Stickman with todo list Illustration</a> by <a href="https://iconscout.com/contributors/iconscout">IconScout Store</a> on <a href="https://iconscout.com">IconScout</a>
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Row(
                children: [
                  Text(
                    "Task List",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width * 0.9,
            child: SingleChildScrollView(
                child: Column(
              children: items
                  .map((item) => GestureDetector(
                        onTap: () async {
                          final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TaskDetailPage(task: item)));
                          setState(() {
                            item.done = result;
                          });
                        },
                        child: Card(
                          color: determineCardColor(item),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 0),
                            child: ListTile(
                              autofocus: true,
                              leading: CircleAvatar(
                                radius: 30,
                                child: Text(item.name[0],
                                    style: const TextStyle(fontSize: 20)),
                              ),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(item.name,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w800)),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    DateFormat('MMM dd,yyyy')
                                        .format(item.dueDate),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            )),
          ),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateTaskPage()));
              setState(() {
                items.add(result);
              });
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFFEE6F57)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
              child: Text(
                style: TextStyle(fontSize: 17, color: Colors.white),
                "Create Task",
              ),
            ),
          )
        ]),
      ),
    );
  }
}
