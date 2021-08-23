import "package:flutter/material.dart";

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GradientAppBar("Custom Gradient App Bar"),
        Container()
      ],
    );
  }
}

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 50.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(255, 0, 0, 0),
            Color.fromRGBO(255, 191, 0, 0),
            Color.fromRGBO(0, 0, 255, 0),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.5, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
    );
  }
}
