import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final Widget chartType;

  Chart(this.chartType);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 200.0,
        child: chartType,
      ),
    );
  }
}
