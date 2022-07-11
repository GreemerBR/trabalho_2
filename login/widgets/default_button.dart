import 'package:flutter/material.dart';

import '../../main_menu/main_menu_page.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return MainMenuPage();
              },
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 99, 66, 191),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'ACESSAR',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
