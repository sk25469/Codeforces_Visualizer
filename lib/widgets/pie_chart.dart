import 'package:codeforces_visualizer/widgets/legends_widget.dart';
import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  final Widget chartType;

  PieChart(this.chartType);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        color: Colors.white,
        height: 220.0,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 30.0,
              right: 5.0,
              child: Container(
                height: 180,
                width: 200,
                color: Colors.white,
                child: chartType,
              ),
            ),
            Positioned(
              top: 30,
              bottom: 20.0,
              left: 10.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: LegendsList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
