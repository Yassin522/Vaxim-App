import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vaxim/config/app_theme.dart';
import 'package:vaxim/utils/helper/app_binding.dart';
import 'config/routes.dart';
import 'utils/services/strapi_payment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  PaymentService.instance.init();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vaxim',
      theme: AppTheme.instance.themeData(),
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      initialRoute: AppRoute.splashPage,
      defaultTransition: Transition.cupertino,
      getPages: AppRoute.getPage,
      builder: EasyLoading.init(),
    );
  }
}
