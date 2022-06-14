import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaxim/config/routes.dart';
import 'package:vaxim/module/controller/auth_controller.dart';
import 'package:vaxim/module/view/profile/profile.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find();
    return Obx(() {
      if (auth.isUserExists.value) {
        return const ProfilePage();
      } else {
        return const Check();
      }
    });
  }
}

class Check extends StatelessWidget {
  const Check({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoute.authPage);
        },
        child: Text(
          "Tap to login".capitalize!,
        ),
      ),
    );
  }
}
