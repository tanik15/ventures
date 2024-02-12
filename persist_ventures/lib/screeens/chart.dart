import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

class Charts extends StatefulWidget {
  const Charts({super.key});

  @override
  ChartsState createState() => ChartsState();
}

class ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Step Line Chart Example')),
      body: Center(
        child: SizedBox(
          width: 300,
            height: 350,
          child: Echarts(
            option: '''
            {
              title: { text: ''},
              tooltip: { trigger: 'axis' },
              legend: { data: ['Step Start', 'Step Middle', 'Step End'] },
              grid: { left: '3%', right: '4%', bottom: '3%', containLabel: false },
              xAxis: { type: 'category', data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'] },
              yAxis: { type: 'value' },
              series: [
                { name: 'Step Start', type: 'line', step: 'start', data: [120, 132, 0, 134, 90, 230, 210] },
              ]
            }
            ''',
          ),
        ),
      ),
    );
  }
}
