import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  final Widget chartType;

  PieChart(this.chartType);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 220.0,
      width: 220.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 50.0,
            right: 10.0,
            child: Container(
              height: 180,
              width: 280,
              color: Colors.white,
              child: chartType,
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 10.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: listWidgets(slices),
            ),
          ),
        ],
      ),
    );
  }
}
