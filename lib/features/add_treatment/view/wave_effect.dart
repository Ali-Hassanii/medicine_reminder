import 'dart:math';

import 'package:flutter/material.dart';

class WaveEffect extends StatelessWidget {
  const WaveEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: CustomPaint(
        painter: Waves(context),
      ),
    );
  }
}

class Waves extends CustomPainter {
  Waves(this.context);
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.style = PaintingStyle.fill;

    List<Path> paths = [
      Path(),
      Path(),
      Path(),
    ];

    for (Path path in paths) {
      path.moveTo(0, size.height / 2);

      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
    }

    int limit = 50;

    for (var i = 0; i <= limit; i++) {
      double x = (i / limit) * size.width;
      double y = size.height * 0.2;

      paths[0].lineTo(
        x,
        y + calcSinY(t: i, range: limit, power: 20, hShift: 15),
      );
      paths[1].lineTo(
        x,
        y + calcSinY(t: i, range: limit, power: 30, hShift: 0),
      );
      paths[2].lineTo(
        x,
        y + calcSinY(t: i, range: limit, power: 40, hShift: -15),
      );
    }

    for (Path path in paths) {
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
    }

    paint.color =
        Theme.of(context).colorScheme.tertiary.withRed(5).withAlpha(90);
    canvas.drawPath(paths[2], paint);
    paint.color =
        Theme.of(context).colorScheme.tertiary.withRed(15).withAlpha(150);
    canvas.drawPath(paths[1], paint);
    paint.color =
        Theme.of(context).colorScheme.tertiary.withRed(20).withAlpha(250);
    canvas.drawPath(paths[0], paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  double calcSinY({
    required int t,
    required int range,
    required double power,
    required double hShift,
  }) {
    return sin((t / (range / 1.6)) * pi + 0.2) * power + hShift;
  }
}
