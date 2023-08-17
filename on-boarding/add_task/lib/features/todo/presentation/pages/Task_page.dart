import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/task.dart';

class TaskDetailPage extends StatefulWidget {
  static const String routeName = '/task';

  final Todo task;
  TaskDetailPage({required this.task});

  @override
  _TaskDetailPageState createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  var checked = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, checked);
          return true; // Sending back the 'checked' value
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Task Detail'),
          ),
          body: Center(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child:
                              Image.asset('assets/images/shopping-list.png')),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 0),
                            child: Text(
                              "Title",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Row(
                            children: [
                              const Text("Done:"),
                              Checkbox(
                                value: widget.task.done,
                                onChanged: (value) {
                                  setState(() {
                                    widget.task.done = !widget.task.done;
                                    checked = widget.task.done;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        color: const Color.fromARGB(63, 158, 158, 158),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
                              child: Text(
                                widget.task.name,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 0),
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      Container(
                        color: const Color.fromARGB(63, 158, 158, 158),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(
                                  widget.task.description,
                                  style: const TextStyle(fontSize: 15),
                                  softWrap: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 0),
                            child: Text(
                              "Deadline",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      Container(
                        color: const Color.fromARGB(63, 158, 158, 158),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
                              child: Text(
                                DateFormat('MMM dd,yyyy')
                                    .format(widget.task.dueDate),
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      )
                    ])),
          ),
        ));
  }
}
