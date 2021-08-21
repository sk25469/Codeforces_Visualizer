import 'package:flutter/material.dart';

class ContestDetail extends StatelessWidget {
  const ContestDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {},
        contentPadding: const EdgeInsets.all(5),
        leading: Column(
          children: [
            Text('Start Time'),
            Text('Aug 26, 2021'),
          ],
        ),
        title: const Text('Codeforces Round #767'),
        trailing: IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.app_registration_rounded),
        ),
      ),
    );
  }
}
