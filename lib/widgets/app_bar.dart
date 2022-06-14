import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/assets_path.dart';
import 'package:vaxim/constants/size.dart';

class AppBarHelper {
  AppBarHelper._();
  static final AppBarHelper _instance = AppBarHelper._();
  static AppBarHelper get instance => _instance;

  AppBar buildAppBar({@required title}) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: SvgPicture.asset(
          backIcon,
          color: kDark,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: kDark,
          fontSize: getTextSize(16),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
