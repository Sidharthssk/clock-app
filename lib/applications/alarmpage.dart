// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:myapp/constants/theme_data.dart';
import 'package:myapp/data.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Text('Alarm',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'avenir')),
          Expanded(
            child: ListView(
                children: alarms.map<Widget>((alarm) {
              return Container(
                margin: EdgeInsets.only(bottom: 32),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: alarm.gradientColors!,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    boxShadow: [
                      BoxShadow(
                          color: alarm.gradientColors!.last.withOpacity(0.4),
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: Offset(4, 4))
                    ],
                    borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.label,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Office',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Avenir'),
                              ),
                            ],
                          ),
                          Switch(
                            onChanged: (bool value) {},
                            value: true,
                            activeColor: Colors.white,
                          )
                        ],
                      ),
                      Text(
                        'Mon-Fri',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'avenir'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '07:00 AM',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'avenir',
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }).followedBy([
              DottedBorder(
                color: CustomColors.clockOutline,
                strokeWidth: 3,
                borderType: BorderType.RRect,
                radius: Radius.circular(24),
                dashPattern: [5, 4],
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: CustomColors.clockBG,
                      borderRadius: BorderRadius.circular(24)),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/add_alarm.png',
                          scale: 1.5,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Add alarm',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'avenir',
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]).toList()),
          )
        ]));
  }
}
