import 'package:flutter/material.dart';

import '../../core/app_assets.dart';

class AboutDealPage extends StatelessWidget {
  const AboutDealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(imgBackgroundAbout, fit: BoxFit.cover),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 250,
                  child: Image.asset(
                    imgLogoApp,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Text(
                'Deal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width - 75,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 99, 66, 191),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'A Deal foi fundada em 2022 pensando em fomentar a Economia Circular no Brasil. Isso porque estimulamos uma cultura de consumo consciente, conectando pessoas para que elas possam emprestar produtos de forma f??cil e r??pida. Para que assim, diversas pessoas possam aproveitar bons produtos e gerar boas mem??rias.',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Nossos usu??rios t??m total controle em suas transa????es e decidem juntos a melhor forma de fechar neg??cio. Na expectativa de um mundo melhor, criamos uma comunidade na qual milh??es de pessoas podem se conectar de maneira colaborativa.',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Afinal, cada pessoa que tem sucesso em seu emprestimo, acaba trazendo mais valor para sociedade em que vivem, pois acreditamos que, al??m de possibilitar benef??cios financeiros contribu??mos para o bem-estar das pessoas e do meio ambiente.',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Assim, com a Deal todo mundo sai ganhando!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
