import 'package:consuni_mobile/app/core/ui/app_ui.dart';
import 'package:consuni_mobile/app/core/ui/widgets/custom_appbar.dart';
import 'package:consuni_mobile/app/core/ui/widgets/custom_buttom.dart';
import 'package:consuni_mobile/app/core/ui/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: CustomAppbar(
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: LayoutBuilder(
            builder: (_, constraints){
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: context.textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.primaryColorDark,
                          ),
                        ),
                        const SizedBox(
                           height: 30,
                        ),
                        const CustomTextformfield(label: 'Email'),
                        const SizedBox(
                           height: 30,
                        ),
                        const CustomTextformfield(label: 'Senha'),
                        const SizedBox(
                           height: 50,
                        ),
                        Center(child: CustomButtom(
                          width: context.width,
                          label: 'ENTRAR',
                          onPressed: (){}
                          ),
                        ),
                        const Spacer(), //empurra o próximo elemento para o rodapé da tela
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Não possui uma conta?'),
                            TextButton(
                              onPressed: (){
                                Get.toNamed('/auth/register');
                              },
                              child: const Text(
                                'Cadastre-se',
                                style: AppUI.textbold,
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
  }
}