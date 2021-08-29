import 'package:codeforces_visualizer/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

class UserAuthScreen extends StatelessWidget {
  static const routeName = '/userauth-screen';
  const UserAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userIdTextController = TextEditingController();
    void _submitData() {
      if (userIdTextController.text.toString().isNotEmpty) {
        Navigator.of(context).pushNamed(TabsScreen.routeName);
        // print(userIdTextController.text.toString());
      } else {
        _showToast(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Codeforces Visualizer'),
      ),
      body: Center(
        child: Card(
          child: Column(
            children: [
              TextField(
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Enter your username",
                ),
                controller: userIdTextController,
                onSubmitted: (_) => _submitData(),
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: const Text('Enter'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Please enter a valid username'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
