import 'package:flutter/material.dart';

class ProfileListItem extends StatelessWidget {
  final String title;

  const ProfileListItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey),
          ),
        ),
        height: 100,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                title,
                style: TextStyle(
                  color: Color.fromARGB(255, 99, 66, 191),
                  fontSize: 20,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_sharp,
              color: Colors.grey,
              size: 38,
            )
          ],
        ),
      ),
    );
  }
}