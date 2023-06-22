import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDay = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      _selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Page'),
      ),
      body: Center(
        child: TableCalendar(
          focusedDay: _selectedDay,
          firstDay: DateTime.utc(2022, 1, 1),
          lastDay: DateTime.utc(2024, 12, 31),
          onDaySelected: _onDaySelected,
        ),
      ),
    );
  }
}


