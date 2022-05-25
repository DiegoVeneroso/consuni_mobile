import 'dart:convert';
import 'dart:io' as Io;
import 'dart:io';

import 'package:consuni_mobile/app/core/ui/app_state.dart';
import 'package:consuni_mobile/app/core/ui/widgets/custom_appbar.dart';
import 'package:consuni_mobile/app/core/ui/widgets/custom_buttom.dart';
import 'package:consuni_mobile/app/core/ui/widgets/custom_textformfield.dart';
import 'package:consuni_mobile/app/models/item_model.dart';
import 'package:consuni_mobile/app/modules/add_item/add_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:validatorless/validatorless.dart';
import 'package:http/http.dart' as http;

class AddItemPage extends StatefulWidget {
  const AddItemPage({Key? key}) : super(key: key);

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends AppState<AddItemPage, AddItemController> {
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  final _formKey = GlobalKey<FormState>();
  final _titleEC = TextEditingController();
  final _subtitleEC = TextEditingController();
  final _descriptionEC = TextEditingController();

  @override
  void dispose() {
    _titleEC.dispose();
    _subtitleEC.dispose();
    _descriptionEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastrar item',
                    style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColorDark,
                    ),
                  ),
                  Text(
                    'Preencha os campos abaixo para cadastrar um novo item.',
                    style: context.textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextformfield(
                    label: 'Título',
                    controller: _titleEC,
                    validator: Validatorless.required('Título é obrigatório'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextformfield(
                    label: 'Subtítulo',
                    controller: _subtitleEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Subtítulo é obrigatório'),
                      Validatorless.min(20, 'Subtítulo muito curto'),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextformfield(
                    label: 'Descrição',
                    controller: _descriptionEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Descrição é obrigatório'),
                      Validatorless.min(20, 'Descrição muito curta'),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      print('cxlicoy');
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => bottomSheet(context));
                    },
                    child: const Text('Imagem'),
                  ),
                  Obx(() => CircleAvatar(
                        backgroundImage:
                            controller.isItemPicPathSet.value == true
                                ? FileImage(File(controller.itemPicPath.value))
                                    as ImageProvider
                                : AssetImage('assets/images/logo.png'),
                        radius: 80,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: CustomButtom(
                      width: context.width,
                      label: 'CADASTRAR',
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          controller.addItem(
                            ItemModel(
                              title: _titleEC.text,
                              subtitle: _subtitleEC.text,
                              descripion: _descriptionEC.text,
                              image: fileToBase64(pickedFile as File),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: Column(
        children: [
          const Text(
            'Selecione a imagem',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.image,
                      color: Colors.green,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Galeria',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.gallery);
                },
              ),
              const SizedBox(
                width: 80,
              ),
              InkWell(
                child: Column(
                  children: const [
                    Icon(
                      Icons.camera,
                      color: Colors.green,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Câmera',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.camera);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<File?> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 25);
    pickedFile = File(pickedImage!.path);
    controller.setItemImagePath(pickedFile!.path);
    Get.back();
    // String imageToString =
    //     Uri.parse(pickedFile.toString()).path.split("/").last;
    print(pickedFile);
    return pickedFile;
  }

  String fileToBase64(File fileImage) {
    final bytes = Io.File(fileImage.path).readAsBytesSync();

    return base64.encode(bytes);
  }
}
