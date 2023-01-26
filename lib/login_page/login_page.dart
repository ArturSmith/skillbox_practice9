import 'package:flutter/material.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const Spacer(flex: 40),
          ElevatedButton(
              onPressed: (() {
                // ButtonFunctions(context).login('');
              }),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                backgroundColor:
                    MaterialStateProperty.all(AppColors().mainAppColor),
                minimumSize: MaterialStateProperty.all(const Size(250, 50)),
                maximumSize: MaterialStateProperty.all(const Size(400, 50)),
              ),
              child: const Text(
                'Log in',
                style: TextStyle(color: Colors.white),
              )),
          const Spacer(flex: 3),
          ElevatedButton(
            onPressed: (() {
              // ButtonFunctions(context).signup('');
            }),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(10),
              backgroundColor:
                  MaterialStateProperty.all(AppColors().mainAppColor),
              minimumSize: MaterialStateProperty.all(const Size(250, 50)),
              maximumSize: MaterialStateProperty.all(const Size(400, 50)),
            ),
            child: const Text(
              'Sign up',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Spacer(flex: 3),
          OutlinedButton(
              onPressed: (() {
                ButtonFunctions(context).withoutRegistration('/HomeMainPage');
              }),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(AppColors().mainAppColor),
                  minimumSize: MaterialStateProperty.all(const Size(250, 50))),
              child: const Text('Contiune without registration')),
          const Spacer(flex: 40)
        ]),
      ),
    );
  }
}

class ButtonFunctions {
  final BuildContext context;

  ButtonFunctions(this.context);

  void login(String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  void signup(String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  void withoutRegistration(String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }
}
