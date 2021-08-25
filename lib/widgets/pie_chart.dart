import 'package:codeforces_visualizer/models/tags.dart';
import 'package:flutter/material.dart';

import '../tag_colors.dart';

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
                children: legendsList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> legendsList() {
  List<Tag> tagColor = [];
  TagColors.colors.forEach((tag, color) {
    tagColor.add(Tag(color, tag));
  });
  return tagColor.map(
    (value) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(width: 10.0),
          Container(
            color: value.color,
            width: 10.0,
            height: 15.0,
          ),
          Container(width: 5.0),
          Text(value.tag),
        ],
      );
    },
  ).toList();
}
