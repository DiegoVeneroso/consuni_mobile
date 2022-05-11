import 'package:consuni_mobile/app/core/ui/app_ui.dart';
import 'package:consuni_mobile/app/core/ui/widgets/custom_appbar.dart';
import 'package:consuni_mobile/app/core/ui/widgets/custom_buttom.dart';
import 'package:consuni_mobile/app/core/ui/widgets/custom_textformfield.dart';
import 'package:consuni_mobile/app/modules/auth/login/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColorDark,
                    ),
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro.',
                    style: context.textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomTextformfield(label: 'Nome'),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomTextformfield(label: 'E-mail'),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomTextformfield(label: 'Senha'),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomTextformfield(label: 'Confirma senha'),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: CustomButtom(
                        width: context.width,
                        label: 'CADASTRAR',
                        onPressed: () {
                          Get.find<RegisterController>().qualquer();
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
