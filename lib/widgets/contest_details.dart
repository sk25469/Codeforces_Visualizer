import 'package:flutter/material.dart';

class ContestDetail extends StatelessWidget {
  const ContestDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
        top: 3,
        bottom: 3,
      ),
      child: Card(
        elevation: 5,
        child: ListTile(
          onTap: () {},
          contentPadding: const EdgeInsets.all(5),
          leading: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text('Start Time '),
              const SizedBox(height: 8),
              const Text('Aug 26'),
            ],
          ),
          title: const Text('Codeforces Round #767'),
          trailing: IconButton(
            tooltip: 'Register for the contest',
            onPressed: () => {},
            icon: const Icon(Icons.app_registration_rounded),
          ),
        ),
      ),
    );
  }
}
