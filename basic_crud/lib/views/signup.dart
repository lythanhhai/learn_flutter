import 'package:basic_crud/controllers/authController.dart';
import 'package:basic_crud/controllers/bookcontroller.dart';
import 'package:basic_crud/models/bookmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class signUp extends StatelessWidget {
  signUp({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: AuthController(),
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            const Center(
                child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 19, color: Colors.blueAccent),
            )),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextField(
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter username...',
                ),
                controller: usernameController,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextField(
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter password...',
                ),
                controller: passwordController,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<AuthController>(
              builder: (_, authController, __) => TextButton(
                  onPressed: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return AlertDialog(
                    //       // Retrieve the text the that user has entered by using the
                    //       // TextEditingController.
                    //       content: Text(
                    //           '${nameBookController.text} - ${descriptionBookController.text}'),
                    //     );
                    //   },
                    // );
                    authController.signup(
                        usernameController.text, passwordController.text);
                    Navigator.pushNamed(context, "/home");
                  },
                  child: const Text("Sign Up")),
            ),
          ],
        ),
      ),
    );
  }
}
