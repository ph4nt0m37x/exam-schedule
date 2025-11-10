import 'package:flutter/material.dart';
import '../models/exam.dart';

class DetailsScreen extends StatelessWidget {
  final Exam exam;

  const DetailsScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final remaining = exam.dateTime.difference(now);
    Color text = Colors.green;

    List<String> months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];

    String formatted =
        '${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}h - ${months[exam.dateTime.month - 1]} ${exam.dateTime.day}, ${exam.dateTime.year}';

    String remaining_formatted = '${remaining.inDays} days ${remaining.inHours%24}h until exam.';

    if (-remaining.inSeconds > 0){ //if its a negative number,
      print("passes");
      remaining_formatted = 'Exam passed ${-remaining.inDays} days ${-remaining.inHours%24}h ago.';
    }


    if (now.isAfter(exam.dateTime)) {
      text = Colors.grey;
    }

    return Scaffold(
      appBar: AppBar(title: Text(exam.name)),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Row(children: [Divider()]),

            Row(
              children: [
                SizedBox(width: 8),
                Icon(Icons.assignment),
                SizedBox(width: 8),
                Text(
                  exam.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                SizedBox(width: 8),
                Icon(Icons.calendar_month_rounded),
                SizedBox(width: 8),
                Text(formatted, style: TextStyle(fontSize: 20)),
              ],
            ),
            Row(children: [Divider()]),
            Row(
              children: [
                SizedBox(width: 8),
                Icon(Icons.location_on_rounded),
                SizedBox(width: 8),
                Text(
                  exam.lab.join(', '),
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(children: [Divider()]),
            Row(
              children: [
                SizedBox(width: 8),
                Icon(Icons.schedule_rounded, color: text,),
                SizedBox(width: 8),
                Text(remaining_formatted,
                  style: TextStyle(fontSize: 20, color: text),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
