import 'package:codeforces_visualizer/models/tags.dart';
import 'package:codeforces_visualizer/tag_colors.dart';
import 'package:flutter/material.dart';

List<Widget> LegendsList() {
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
