import 'dart:developer';

import 'package:consuni_mobile/app/core/exceptions/user_notfound_exception.dart';
import 'package:consuni_mobile/app/core/rest_client/rest_client.dart';
import 'package:consuni_mobile/app/models/user_model.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post('/auth/register', {
      'name': name,
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      var message = 'Erro ao registrar usuário';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }

      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(message);
    }

    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post('/auth/', {
      'email': email,
      'password': password,
      // 'social_login': false,
      // 'supplier_user': false
    });

    if (result.hasError) {
      if (result.statusCode == 403) {
        log(
          'usuario ou senha inválidos',
          error: result.statusText,
          stackTrace: StackTrace.current,
        );

        throw UserNotFoundException();
      }

      log(
        'Erro ao autenticar o usuário (${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao autenticar usuário');
    }

    return UserModel.fromMap(result.body);
  }

  @override
  Future<UserModel> getUser(int id) async {
    final result = await _restClient.get('/user/');

    if (result.hasError) {
      log(
        'Erro ao buscar o item principal ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao buscar os items principais');
    }
    return result.body.map<UserModel>((p) => UserModel.fromMap(p)).toList();
  }
}
