import 'package:flutter/material.dart';

import '../../main_menu/main_menu_page.dart';

class FakeButtonContainer extends StatelessWidget {
  const FakeButtonContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          minWidth: 250,
          height: 85,
          color: Color.fromARGB(255, 99, 66, 191),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return MainMenuPage();
                },
              ),
            );
          },
          child: Text(
            "Filtrar",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}