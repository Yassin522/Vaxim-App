import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vaxim/module/model/auth_error_model.dart';
import 'package:vaxim/module/model/auth_model.dart';
import 'package:vaxim/utils/services/api/auth_service.dart';

class AuthController extends GetxController {
  var authLoading = false.obs;
  var token = "".obs;
  var userId = "".obs;
  var errorMsg = "".obs;
  var authModel = AuthModel().obs;
  var authErrorModel = AuthErrorModel().obs;
  var isUserExists = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    checkToken();
  }

  /*<---------------------Register--------------------->*/

  Future<bool> userRegister(
      {@required username, @required email, @required pass}) async {
    try {
      authLoading(true);
      final result =
          await AuthServices.instance.registerFromApi(username, email, pass);
      if (result['code'] == 200) {
        authModel.value = AuthModel.fromJson(result['data']);
        box.write("token", authModel.value.jwt);
        box.write("id", authModel.value.user!.id);
        box.write("auth_model", result['data']);
        checkToken();
        return true;
      } else {
        authErrorModel.value = AuthErrorModel.fromJson(result['data']);
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      rethrow;
    } finally {
      authLoading(false);
    }
  }

  /*<---------------------Login--------------------->*/

  Future<bool> userLogin({@required email, @required pass}) async {
    try {
      authLoading(true);
      final result = await AuthServices.instance.loginFromApi(email, pass);
      if (result['code'] == 200) {
        authModel.value = AuthModel.fromJson(result['data']);
        box.write("token", authModel.value.jwt);
        box.write("id", authModel.value.user!.id);
        box.write("auth_model", result['data']);
        checkToken();
        update();
        return true;
      } else {
        authErrorModel.value = AuthErrorModel.fromJson(result['data']);
        update();
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      rethrow;
    } finally {
      authLoading(false);
    }
  }

  void checkToken() {
    final _token = box.read("token");
    final _id = box.read("id");
    final _model = box.read("auth_model");

    if (_token != null && _id != null) {
      token.value = _token.toString();
      userId.value = _id.toString();
      authModel.value = AuthModel.fromJson(_model);
      isUserExists(true);
    } else {
      isUserExists(false);
    }
  }
}
