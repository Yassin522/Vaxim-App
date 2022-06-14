import 'package:get/get.dart';
import 'package:vaxim/module/controller/app_controller.dart';
import 'package:vaxim/module/controller/auth_controller.dart';
import 'package:vaxim/module/controller/cart_controller.dart';
import 'package:vaxim/module/controller/data_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController(),fenix: true);
    Get.lazyPut<AuthController>(() => AuthController(),fenix: true);
    Get.lazyPut<CartController>(() => CartController(),fenix: true);
    Get.lazyPut<DataController>(() => DataController(),fenix: true);
  }
}
