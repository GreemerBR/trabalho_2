import 'package:flutter/material.dart';

import 'widgets/body_announcement.dart';

// ignore: must_be_immutable
class AnnoucementPage extends StatefulWidget {
  AnnoucementPage({
    Key? key,
    this.isFavorite = false,
  }) : super(key: key);

  bool isFavorite;

  @override
  State<AnnoucementPage> createState() => _AnnoucementPageState();
}

class _AnnoucementPageState extends State<AnnoucementPage> {
  void makeFavorite() {
    setState(() {
      widget.isFavorite = !widget.isFavorite;
    });
  }

  void whatsAppOpen() async {
    // TODO: VER ISSO !!!!!
    //https://pub.dev/packages/url_launcher/example
    // await FlutterLaunch.launchWhatsapp(phone: '+5547991885219', message: 'Oi');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          "Informações",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 99, 66, 191),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                makeFavorite();
              },
              icon: Icon(
                widget.isFavorite ? Icons.star : Icons.star_border,
                color: (widget.isFavorite ? Colors.white : Colors.grey),
              ),
              splashRadius: 1,
            ),
          ),
        ],
      ),
      body: BodyAnnouncement(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () async {
          whatsAppOpen();
        },
        child: const Icon(
          Icons.whatsapp,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}