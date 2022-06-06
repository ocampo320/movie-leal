import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:move_app/sign_up__module/application/widgets/text_input.dart';
import 'package:move_app/utils/colors.dart';
import 'package:move_app/welcome_module/application/widgets/button_login.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController t = TextEditingController();
    return SingleChildScrollView(
      child: Container(
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
          Container(
            height: 400,
            width: double.infinity,
            decoration:  BoxDecoration(
              color:  Colors.black.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  TexInput(
                    label: "Name",
                    textEditingController: t,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TexInput(
                    label: "Password",
                    textEditingController: t,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  ButtonLogin(
                    title: "Log in",
                    color: MoveColor.white,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          )
        ])),
      ),
    );
  }
}
