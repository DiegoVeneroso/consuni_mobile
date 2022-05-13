import 'dart:developer';

import 'package:consuni_mobile/app/core/mixins/loader_mixin.dart';
import 'package:consuni_mobile/app/core/mixins/messages_mixin.dart';
import 'package:consuni_mobile/app/core/rest_client/rest_client.dart';
import 'package:consuni_mobile/app/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  RegisterController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle(); //abre o loading

      await _authRepository.register(name, email, password);

      _loading.toggle(); //fecha o loading

      Get.back();

      _message(MessageModel(
        title: 'Sucesso',
        message: 'Cadastro realizado com sucesso',
        type: MessageType.info,
      ));
    } on RestClientException catch (e, s) {
      _loading.toggle(); //fecha o loaging que foi aberto no try

      log('Erro ao registrar o usuario', error: e, stackTrace: s);

      _message(
        MessageModel(
          title: 'Erro',
          message: e.message,
          type: MessageType.error,
        ),
      );
    } catch (e, s) {
      log('Erro ao registrar o usuario', error: e, stackTrace: s);

      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao registrar o usuario',
          type: MessageType.error,
        ),
      );
    }
  }
}
