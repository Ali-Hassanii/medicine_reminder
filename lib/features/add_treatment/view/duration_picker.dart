import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/features/add_treatment/bloc/add_treatment_bloc.dart';
import 'package:numberpicker/numberpicker.dart';

class DurationPicker extends StatefulWidget {
  const DurationPicker({super.key});

  @override
  State<DurationPicker> createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
  late int _days;
  late int _hours;
  late int _minutes;

  @override
  void initState() {
    super.initState();
    final initialValue =
        context.read<AddTreatmentBloc>().state.duration ?? Duration.zero;
    _days = initialValue.inDays;
    _hours = initialValue.inHours % 24;
    _minutes = initialValue.inMinutes % 60;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: _content,
      actions: _actions,
    );
  }

  Widget get _content {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Days"),
              NumberPicker(
                infiniteLoop: true,
                value: _days,
                minValue: 0,
                maxValue: 365,
                onChanged: (value) {
                  setState(() {
                    _days = value;
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Hours"),
              NumberPicker(
                infiniteLoop: true,
                value: _hours,
                minValue: 0,
                maxValue: 23,
                onChanged: (value) {
                  setState(() {
                    _hours = value;
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Minutes"),
              NumberPicker(
                infiniteLoop: true,
                value: _minutes,
                minValue: 0,
                maxValue: 59,
                step: 5,
                onChanged: (value) {
                  setState(() {
                    _minutes = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> get _actions {
    return [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("Cancel"),
      ),
      TextButton(
        onPressed: () {
          final duration = Duration(
            days: _days,
            hours: _hours,
            minutes: _minutes,
          );
          context.read<AddTreatmentBloc>().add(FormDurationChanged(duration));
          Navigator.of(context).pop();
        },
        child: Text("OK"),
      ),
    ];
  }
}
