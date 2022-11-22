import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(const DrawerPage());

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DrawerPageCalendar(),
    );
  }
}

class DrawerPageCalendar extends StatefulWidget {
  const DrawerPageCalendar({super.key});

  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

class ScheduleExample extends State<DrawerPageCalendar> {
  final CalendarController _controller = CalendarController();
  final List<String> _items = [
    'Day view',
    'Week view',
    'Work week view',
    'Month view',
    'Schedule view',
    'Timeline day',
    'Timeline week',
    'Timeline work week',
    'Timeline month'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SfCalendar(
            view: CalendarView.month,
            controller: _controller,
            dataSource: _getCalendarDataSource(),
          )),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                child: ListTile(
                  title: Text(_items[index]),
                ),
                onTap: () {
                  if (index == 0) {
                    _controller.view = CalendarView.day;
                    Navigator.pop(context);
                  } else if (index == 1) {
                    _controller.view = CalendarView.week;
                    Navigator.pop(context);
                  } else if (index == 2) {
                    _controller.view = CalendarView.workWeek;
                    Navigator.pop(context);
                  } else if (index == 3) {
                    _controller.view = CalendarView.month;
                    Navigator.pop(context);
                  } else if (index == 4) {
                    _controller.view = CalendarView.schedule;
                    Navigator.pop(context);
                  } else if (index == 5) {
                    _controller.view = CalendarView.timelineDay;
                    Navigator.pop(context);
                  } else if (index == 6) {
                    _controller.view = CalendarView.timelineWeek;
                    Navigator.pop(context);
                  } else if (index == 7) {
                    _controller.view = CalendarView.timelineWorkWeek;
                    Navigator.pop(context);
                  } else if (index == 8) {
                    _controller.view = CalendarView.timelineMonth;
                    Navigator.pop(context);
                  }
                });
          },
        ),
      ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 2)),
      subject: 'Meeting',
      color: Colors.green,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 3)),
      endTime: DateTime.now().add(const Duration(hours: 4)),
      subject: 'Planning',
      color: Colors.orange,
    ));
    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}