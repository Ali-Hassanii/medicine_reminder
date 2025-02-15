import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class DurationPicker extends StatefulWidget {
  const DurationPicker(
      {super.key,
      required Duration initialInterval,
      required void Function(Duration interval) onIntervalChanged})
      : _initialInterval = initialInterval,
        _onIntervalChanged = onIntervalChanged;

  final Duration _initialInterval;
  final void Function(Duration interval) _onIntervalChanged;

  @override
  State<DurationPicker> createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
  late int days = widget._initialInterval.inDays;
  late int hours = widget._initialInterval.inHours % 24;
  late int minutes = widget._initialInterval.inMinutes % 60;

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
                value: days,
                minValue: 0,
                maxValue: 90,
                onChanged: (value) {
                  setState(() {
                    days = value;
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
                value: hours,
                minValue: 0,
                maxValue: 23,
                onChanged: (value) {
                  setState(() {
                    hours = value;
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
                value: minutes,
                minValue: 0,
                maxValue: 59,
                step: 5,
                onChanged: (value) {
                  setState(() {
                    minutes = value;
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
          widget._onIntervalChanged(
            Duration(days: days, hours: hours, minutes: minutes),
          );
          Navigator.of(context).pop();
        },
        child: Text("OK"),
      ),
    ];
  }
}
