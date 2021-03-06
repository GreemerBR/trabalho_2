import 'package:flutter/cupertino.dart';

import '../../../core/app_assets.dart';
import 'slide_component_announces.dart';


class BodyAnnouncement extends StatelessWidget {
  const BodyAnnouncement({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: SlideComponentAnnounces(
              listCarousel: imageList,
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'R\$ ${product['AnunValor']}',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            product['AnunTitulo'],
                            style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 196, 196, 196),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            '${product['AnunEndereco']} - ${product['AnunData']}',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(255, 196, 196, 196),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 20),
                            child: Text(
                              'Descri????o',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              top: 5,
                              right: 25,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 75),
                              child: Text(
                                product['AnunDescri'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 196, 196, 196),
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
