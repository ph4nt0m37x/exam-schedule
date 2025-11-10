import 'package:exam_schedule_project/screens/details.dart';
import 'package:exam_schedule_project/screens/home.dart';
import 'package:flutter/material.dart';
import 'models/exam.dart';

final List<Exam> exams = [ // const will not work cause of the DateTime variable in Exam
  Exam(name: 'Probability & Statistics', dateTime: DateTime(2025, 11, 20, 9, 30), lab: ['Baraka 2.1', 'Baraka 2.2']),
  Exam(name: 'Cybersecurity', dateTime: DateTime(2025, 11, 21, 09, 00), lab: ['Lab 117', 'Lab 138', 'Lab 215']),
  Exam(name: 'Mobile Information Systems', dateTime: DateTime(2025, 11, 22, 11, 45), lab: ['Lab 117']),
  Exam(name: 'Calculus', dateTime: DateTime(2025, 8, 29, 9, 00), lab: ['Baraka 2.1', 'Baraka 2.2']),
  Exam(name: 'Mobile Platforms & Programming', dateTime: DateTime(2025, 11, 17, 11, 00), lab: ['Lab 138']),
  Exam(name: 'Databases', dateTime: DateTime(2025, 11, 19, 14, 00), lab: ['Lab 117', 'Lab 215']),
  Exam(name: 'Discrete Mathematics', dateTime: DateTime(2025, 11, 15, 10, 15), lab: ['Baraka 2.1']),
  Exam(name: 'DevOps', dateTime: DateTime(2025, 9, 15, 12, 0), lab: ['Lab 215']),
  Exam(name: 'Integrated Systems', dateTime: DateTime(2025, 9, 17, 12, 10), lab: ['Lab 117']),
  Exam(name: 'Computer Ethics', dateTime: DateTime(2025, 11, 15, 14, 15), lab: ['Baraka 3.2']),
  Exam(name: 'Visual Programming', dateTime: DateTime(2025, 9, 15, 8, 30), lab: ['Lab 117']),
  Exam(name: 'Structural Programming', dateTime: DateTime(2025, 11, 10, 2, 46), lab: ['Lab 138', 'Lab 200AB']),
  Exam(name: 'Object Oriented Analysis Design', dateTime: DateTime(2025, 11, 24, 15, 00), lab: ['Lab 215']),
  Exam(name: 'Internet Technologies', dateTime: DateTime(2025, 9, 11, 17, 30), lab: ['Lab 117']),
  Exam(name: 'E-Government', dateTime: DateTime(2025, 9, 22, 19, 00), lab: ['Lab 200AB']),
];


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schedule for exams',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      routes: {
        "/": (context) => HomeScreen(exams: exams),
        "/details": (context) => DetailsScreen(
            exam: ModalRoute.of(context)!.settings.arguments as Exam)
      }
    );
  }
}