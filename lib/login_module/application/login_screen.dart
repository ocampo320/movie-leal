import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:move_app/login_module/application/widgets/button_login.dart';
import 'package:move_app/utils/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/loginImg.jpg'), fit: BoxFit.cover),
      ),
      child: Center(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Text(
            "Welcome!",
            style: TextStyle(
                color: MoveColor.white,
                fontWeight: FontWeight.w500,
                fontSize: 30),
          ),
        ),
        const SizedBox(
          height: 300,
        ),
        Column(
          children: [
            ButtonLogin(
              title: "Sign up",
              color: MoveColor.yellow,
              function: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonLogin(
              title: "Log in",
              color: MoveColor.white,
              function: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Forgot password?',style: TextStyle(color: MoveColor.white,fontSize: 20),)
          ],
        )
      ])),
    );
  }
}
