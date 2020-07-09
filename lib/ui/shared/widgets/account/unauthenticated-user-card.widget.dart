import 'package:flutter/material.dart';
import 'package:shopping_v2/ui/android/pages/signin.page.dart';
import 'package:shopping_v2/ui/android/pages/signup.page.dart';

class UnauthenticatedUserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 60,
        ),
        FlatButton(
          child: Text('Autentique-se'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return SigninPage();
              }),
            );
          },
        ),
        FlatButton(
          child: Text('Ainda não sou cadastrado'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return SignupPage();
              }),
            );
          },
        ),
      ],
    );
  }
}
