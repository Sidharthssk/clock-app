import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  final double size;

  const ClockView({required this.size, Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY) + 15;
    var fillBrush = Paint()..color = Color(0xFF444974);
    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 20;
    var centerBrush = Paint()..color = Color(0XFFEACEFF);
    var secHandBrush = Paint()
      ..strokeCap = StrokeCap.round
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 60;
    var minuteHand = Paint()
      ..strokeCap = StrokeCap.round
      ..shader =
          RadialGradient(colors: [Colors.lightBlue, Colors.lightBlueAccent])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 30;
    var hourHand = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 24;
    var dashBrush = Paint()..color = Colors.white;

    canvas.drawCircle(center, radius * 0.75, fillBrush);
    canvas.drawCircle(center, radius * 0.75, outlineBrush);

    var hourHandX = centerX +
        radius *
            0.4 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * (pi / 180));
    var hourHandY = centerY +
        radius *
            0.4 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * (pi / 180));
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHand);

    var minuteHandX =
        centerX + radius * 0.6 * cos((dateTime.minute * 6) * (pi / 180));
    var minuteHandY =
        centerY + radius * 0.6 * sin((dateTime.minute * 6) * (pi / 180));
    canvas.drawLine(center, Offset(minuteHandX, minuteHandY), minuteHand);

    var secHandX =
        centerX + radius * 0.6 * cos((dateTime.second * 6) * (pi / 180));
    var secHandY =
        centerY + radius * 0.6 * sin((dateTime.second * 6) * (pi / 180));
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);
    canvas.drawCircle(center, radius * 0.12, centerBrush);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius * 0.9;
    for (double i = 0; i <= 360; i += 15) {
      var x1 = centerX + innerCircleRadius * cos(i * (pi / 180));
      var y1 = centerY + innerCircleRadius * sin(i * (pi / 180));

      if (i % 30 == 0) {
        var x2 = centerX + (outerCircleRadius + 10) * cos(i * (pi / 180));
        var y2 = centerY + (outerCircleRadius + 10) * sin(i * (pi / 180));
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
      } else {
        var x2 = centerX + outerCircleRadius * cos(i * (pi / 180));
        var y2 = centerY + outerCircleRadius * sin(i * (pi / 180));
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
