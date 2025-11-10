import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Exam> exams;

  const HomeScreen({super.key, required this.exams});

  @override
  Widget build(BuildContext context) {
    final sorted = List<Exam>.from(exams)
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 221508', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Container(color: Colors.black87, height: 5),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: sorted.length,
              itemBuilder: (context, index) {
                final exam = sorted[index];
                return ExamCard(exam: exam);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(
          side: BorderSide(color: Colors.green, width: 3),
        ),
        backgroundColor: Colors.white70,
        onPressed: null,
        child: Text(sorted.length.toString()),
      ),
    );
  }
}
