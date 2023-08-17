import 'dart:math';

import 'package:add_task/features/todo/domain/entities/task.dart';
import 'package:add_task/features/todo/presentation/pages/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateTaskPage extends StatefulWidget {
  static const String routeName = '/create';

  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  late DateTime finalPickedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900, 1),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        finalPickedDate = pickedDate;
      });

      // ignore: use_build_context_synchronously
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDate),
      );
      if (pickedTime != null) {
        selectedDate = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        _dateController.text =
            DateFormat('MMM dd, yyyy h:mm a').format(selectedDate);
      }
    }
  }

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: SizedBox(
            child: Form(
          key: formKey,
          child: Column(children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                  child: Text(
                    "Main Task Name",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 237, 96, 68)),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 192, 192, 192)
                        .withOpacity(0.5), // Color of shadow
                    spreadRadius: 3, // Spread distance
                    blurRadius: 5, // Blur radius
                    offset: const Offset(2, 2), // Offset in X and Y axes
                  ),
                ],
              ),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(0, 252, 116, 89), width: 0)),
                  hintText: 'Task Name',
                ),
                validator: (String? name) {
                  if (name == null || name.isEmpty) {
                    return "Task name can not be empty";
                  }
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                  child: Text(
                    "Due Date",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 237, 96, 68)),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 192, 192, 192)
                        .withOpacity(0.5), // Color of shadow
                    spreadRadius: 3, // Spread distance
                    blurRadius: 5, // Blur radius
                    offset: const Offset(2, 2), // Offset in X and Y axes
                  ),
                ],
              ),
              child: TextFormField(
                controller: _dateController,
                onTap: () {
                  _selectDate(context);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(0, 252, 116, 89), width: 0)),
                  hintText: 'Select Date',
                ),
                validator: (String? name) {
                  if (name == null || name.isEmpty) {
                    return "Due-Date can not be empty";
                  }
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                  child: Text(
                    "Description",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 237, 96, 68)),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 192, 192, 192)
                        .withOpacity(0.5), // Color of shadow
                    spreadRadius: 3, // Spread distance
                    blurRadius: 5, // Blur radius
                    offset: const Offset(2, 2), // Offset in X and Y axes
                  ),
                ],
              ),
              child: TextFormField(
                controller: descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(0, 252, 116, 89), width: 0)),
                  hintText: 'Description',
                ),
                validator: (String? name) {
                  if (name == null || name.isEmpty) {
                    return "Desciption can not be empty";
                  }
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            ElevatedButton(
              onPressed: () async {
                final formValid = formKey.currentState!.validate();
                if (!formValid) {
                  return;
                }
                Navigator.pop(
                    context,
                    Todo(
                        name: nameController.text,
                        dueDate: finalPickedDate,
                        description: descriptionController.text,
                        id: "329"));
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFEE6F57)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: Text(
                  style: TextStyle(fontSize: 17, color: Colors.white),
                  "Add Task",
                ),
              ),
            )
          ]),
        )),
      ),
    );
  }
}
