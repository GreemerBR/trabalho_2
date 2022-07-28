import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/app_assets.dart';
import '../../../../core/database.dart';
import '../../../../core/get_it.dart';
import '../../widgets/profile_summary_informations.dart';
import 'profile_list_informations.dart';

class BodyMyProfileEditor extends StatefulWidget {
  BodyMyProfileEditor({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyMyProfileEditor> createState() => _BodyMyProfileEditorState();
}

class _BodyMyProfileEditorState extends State<BodyMyProfileEditor> {
  TextEditingController nameController = TextEditingController();
  TextEditingController apelidoController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController ruaController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController complementoController = TextEditingController();

  final database = getIt.get<DatabaseApp>();
  final user = FirebaseAuth.instance.currentUser!;

  var photo;
  String tempPhoto = imgAvatar;
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        photo = imageTemp;
      });
    } catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: database.select(
          tableName: 'Users',
          columnNames: [
            'UserNomeCompleto',
            'UserEmail',
            'UserApelido',
            'UserCPF',
            'UserCep',
            'UserTelefone',
            'UserCidade',
            'UserRua',
            'UserNumero',
            'UserComplemento',
            'UserEstado'
          ],
          condition: 'UserEmail = "${user.email!}"'),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ProfileSummaryInformations(
                    photo: photo != null ? photo : tempPhoto,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                        bottom: 80,
                      ),
                      child: Transform.rotate(
                        angle: 0.15,
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 25,
                          ),
                          onPressed: () {
                            pickImage();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ProfileListInformation(
                        initialText:
                            snapshot.data![0]["UserNomeCompleto"] == null
                                ? ''
                                : snapshot.data![0]["UserNomeCompleto"],
                        boxLabel: 'Nome completo',
                        controller: nameController,
                      ),
                      ProfileListInformation(
                        initialText: snapshot.data![0]["UserApelido"] == null
                            ? ''
                            : snapshot.data![0]["UserApelido"],
                        boxLabel: 'Apelido',
                        controller: apelidoController,
                      ),
                      ProfileListInformation(
                        initialText: snapshot.data![0]["UserCPF"] == null
                            ? ''
                            : snapshot.data![0]["UserCPF"],
                        boxLabel: 'CPF/CNPJ',
                        controller: cpfController,
                      ),
                      ProfileListInformation(
                        initialText: snapshot.data![0]["UserEmail"] == null
                            ? ''
                            : snapshot.data![0]["UserEmail"],
                        boxLabel: 'Email',
                        controller: emailController,
                      ),
                      ProfileListInformation(
                        initialText: snapshot.data![0]["UserTelefone"] == null
                            ? ''
                            : snapshot.data![0]["UserTelefone"],
                        boxLabel: 'Telefone',
                        controller: telefoneController,
                      ),
                      ProfileListInformation(
                        initialText: snapshot.data![0]["UserCep"] == null
                            ? ''
                            : snapshot.data![0]["UserCep"],
                        boxLabel: 'CEP',
                        controller: cepController,
                      ),
                      ProfileListInformation(
                        initialText: snapshot.data![0]["UserRua"] == null
                            ? ''
                            : snapshot.data![0]["UserRua"],
                        boxLabel: 'Rua',
                        controller: ruaController,
                      ),
                      ProfileListInformation(
                        initialText: snapshot.data![0]["UserNumero"] == null
                            ? ''
                            : snapshot.data![0]["UserNumero"],
                        boxLabel: 'Número',
                        controller: numeroController,
                      ),
                      ProfileListInformation(
                        initialText:
                            snapshot.data![0]["UserComplemento"] == null
                                ? ''
                                : snapshot.data![0]["UserComplemento"],
                        boxLabel: 'Complemento',
                        controller: complementoController,
                      ),
                    ],
                  ),
                ),
              ),
              // SaveButtonProfile(),
            ],
          ),
        );
      },
    );
  }
}
