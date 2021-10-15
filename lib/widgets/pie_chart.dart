import 'package:codeforces_visualizer/models/problem_detail_by_tags.dart';
import 'package:codeforces_visualizer/models/tags.dart';
import 'package:flutter/material.dart';

import '../tag_colors.dart';

class PieChart extends StatelessWidget {
  final Widget chartType;
  final List<ProblemDetailByTags> tagData;

  PieChart(this.chartType, this.tagData);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: InkWell(
        onTap: () {
          // print('Pressed card');
        },
        child: Container(
          color: Colors.white,
          height: 210.0,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 5.0,
                right: 3.0,
                child: Container(
                  height: 190,
                  width: 200,
                  color: Colors.white,
                  child: chartType,
                ),
              ),
              Positioned(
                top: 10,
                bottom: 10.0,
                left: 10.0,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: legendsList(tagData),
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 180,
                right: 25.0,
                child: Text(
                  'Details',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> legendsList(List<ProblemDetailByTags> tagData) {
  List<Tag> tagColor = [];
  TagColors.colors.forEach(
    (tag, color) {
      tagColor.add(Tag(color, tag));
    },
  );
  // for (int i = 0; i < tagData.length; i++) {
  //   // print(
  //   // 'Tag name ${tagData[i].tag} \n No. of questions : ${tagData[i].quesCnt}');
  // }
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
          Container(width: 5.0),
          Text(tagData.indexWhere((element) => element.tag == value.tag) != -1
              ? tagData[tagData.indexWhere((element) => element.tag == value.tag)]
                  .quesCnt
                  .toString()
              : "0"),
        ],
      );
    },
  ).toList();
}
