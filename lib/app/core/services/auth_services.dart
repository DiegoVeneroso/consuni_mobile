import 'package:consuni_mobile/app/core/constants/constants.dart';
import 'package:consuni_mobile/app/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthServices extends GetxService {
  final _isLogged = RxnBool();
  final _getStorage = GetStorage();

  Future<AuthServices> init() async {
    _getStorage.listenKey(Constants.USER_KEY, (value) {
      //forma didática
      if (value != null) {
        _isLogged(true);
      } else {
        _isLogged(false);
      }

      //forma reduzida
      //_isLogged(value != null);
    });

    ever<bool?>(_isLogged, (isLogged) {
      if (isLogged == null || !isLogged) {
        Get.offAllNamed('/auth/login');
      } else {
        Get.offAllNamed('/home');
      }
    });

    //forma didática
    final isLoggedData = getUserId() != null;
    _isLogged(isLoggedData);

    //forma reduzida
    //_isLogged(getUserId() != null);

    return this;
  }

  void logout() {
    _getStorage.write(Constants.USER_KEY, null);
    _getStorage.write(Constants.USER_NAME, null);
    _getStorage.write(Constants.USER_EMAIL, null);
    _getStorage.write(Constants.USER_IMAGE, null);
    _getStorage.write(Constants.USER_REP, null);
  }

  int? getUserId() => _getStorage.read(Constants.USER_KEY);

  UserModel getUserbyId() {
    String source = '''
"id": 23,
      "name": "Diego Veneroso",
      "email": "testes@teste.com",
      "password": ""
''';

    return UserModel.fromJson(source);
    // _getStorage.listenKey(Constants.USER_KEY, (value) {
    //   //forma didática
    //   if (value != null) {
    //     _isLogged(true);
    //   } else {
    //     _isLogged(false);
    //   }

    //   //forma reduzida
    //   //_isLogged(value != null);
    // });

    // ever<bool?>(_isLogged, (isLogged) {
    //   if (isLogged == null || !isLogged) {
    //     Get.offAllNamed('/auth/login');
    //   } else {
    //     Get.offAllNamed('/home');
    //   }
    // });

    // //forma didática
    // final isLoggedData = getUserId() != null;
    // _isLogged(isLoggedData);

    // //forma reduzida
    // //_isLogged(getUserId() != null);

    // return this;
  }
}
