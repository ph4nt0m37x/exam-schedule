import 'package:flutter/material.dart';
import '../models/exam.dart';


class ExamCard extends StatelessWidget {
  final Exam exam;
  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    Color color = Colors.green;
    Color text = Colors.black;

    List<String> months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];

    if (now.isAfter(exam.dateTime)) {
      color = Colors.grey;
      text = Colors.grey;
    }

    String formatted = '${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}h - ${months[exam.dateTime.month - 1]} ${exam.dateTime.day}, ${exam.dateTime.year}';

    return GestureDetector(
      onTap: () {
        print('Tapped ${exam.name}');
        Navigator.pushNamed(context, "/details", arguments: exam);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
            padding: EdgeInsets.all(5),
        child: Column(
          children: [

              Row(
                children: [
                  Divider()
                ],
              ),

        Row (
          children: [
            SizedBox(width: 8),
            Icon(Icons.assignment),
            SizedBox(width: 8),
            Text(exam.name, style: TextStyle(fontSize: 22, color: text, fontWeight: FontWeight.bold)),
          ],
        ),
            Divider(),
            Row(
              children: [
                SizedBox(width: 8),
                Icon(Icons.calendar_month_rounded),
                SizedBox(width: 8),
                Text(formatted, style: TextStyle(fontSize: 20, color: text)),
              ],
            ),
            Row(
              children: [
                Divider()
              ],
            ),
            Row (
              children: [
                SizedBox(width: 8),
                Icon(Icons.location_on_rounded),
                SizedBox(width: 8),
                Text(exam.lab.join(', '), style: TextStyle(fontSize: 20, color: text)),
              ],
            ),
            Row(
              children: [
                Divider()
              ],
            ),
          ],
        ),)
      )
    );
  }
}