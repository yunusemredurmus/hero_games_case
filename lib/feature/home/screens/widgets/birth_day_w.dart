import 'package:flutter/material.dart';

class BirthdayWidget extends StatefulWidget {
  const BirthdayWidget({Key? key}) : super(key: key);

  @override
  State<BirthdayWidget> createState() => _BirthdayWidgetState();
}

class _BirthdayWidgetState extends State<BirthdayWidget> {
  DateTimeRange daterange = DateTimeRange(
    start: DateTime(1900, 1, 1),
    end: DateTime.now(),
  );

  Future<void> _selectDateRange(BuildContext context) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now(),
      initialDateRange: daterange,
    );

    if (picked != null && picked != daterange) {
      setState(() {
        daterange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Doğum Tarihi: ${daterange.start.day}/${daterange.start.month}/${daterange.start.year} - ${daterange.end.day}/${daterange.end.month}/${daterange.end.year}',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () => _selectDateRange(context),
            child: Text('Doğum Tarihi Seç'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: BirthdayWidget(),
      ),
    ),
  );
}
