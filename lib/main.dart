import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:custom_timer/custom_timer.dart';

import 'view timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Düğün Sayacı',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Düğün Sayacı'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              DateFormat('dd/MM/yyyy HH:mm').format(_selectedDate),
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: _selectedDate.add(
                    const Duration(days: 5000),
                  ),
                ).then((value) {
                  setState(() {
                    _selectedDate = value!;
                  });
                });
              },
              child: const Text('Tarih Seçin'),
            ),
            OutlinedButton(
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
                ).then((value) {
                  setState(() {
                    _selectedDate = DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day, value?.hour ?? 0, value?.minute ?? 0);
                  });
                });
              },
              child: const Text('Saati Seçin'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewTimerPage(date: _selectedDate)));
              },
              child: const Text('Sayacı Göster'),
            ),
          ],
        ),
      ),

    );
  }
}


