import 'package:flutter/cupertino.dart';
import 'package:move_app/utils/colors.dart';
import 'package:move_app/main_module/welcome_module/application/widgets/button_login.dart';
import 'package:move_app/main_module/welcome_module/infraestructure/welcome_provider.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //WelcomeProvider provider = context.read<WelcomeProvider>();

    return ChangeNotifierProvider(
        create: (_) => WelcomeProvider(),
        child: Consumer<WelcomeProvider>(
          builder: (BuildContext context, WelcomeProvider welcomeProvider,
                  Widget? child) =>
              Container(
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
                    fontSize:20,
                    height: 45,
                    width: 180,
                    title: "Sign up",
                    color: MoveColor.yellow,
                    onTap: () {

                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonLogin(
                    fontSize:20,
                    height: 45,
                    width: 180,
                    title: "Log in",
                    color: MoveColor.white,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/signUp', (route) => false);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Forgot password?',
                    style: TextStyle(color: MoveColor.white, fontSize: 20),
                  )
                ],
              )
            ])),
          ),
        ));
  }
}
