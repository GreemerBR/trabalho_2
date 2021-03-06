import 'package:flutter/material.dart';

class MainMenuButton extends StatelessWidget {
  const MainMenuButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.func,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Function() func;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Color.fromARGB(255, 192, 180, 225),
      onPressed: func,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
