import 'package:flutter/material.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Spacer(
                flex: 40,
              ),
              Text(
                'Найти кров и пойло',
                style: TextStyle(
                    color: AppColors().mainAppColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(
                flex: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border:
                        Border.all(color: AppColors().mainAppColor, width: 5)),
                child: IconButton(
                  iconSize: 100,
                  onPressed: (() {
                    Navigator.pushReplacementNamed(context, '/HomePage');
                  }),
                  icon: const Icon(
                    Icons.sports_bar,
                  ),
                  color: AppColors().mainAppColor,
                ),
              ),
              const Spacer(
                flex: 40,
              ),
            ],
          ),
        ),
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
