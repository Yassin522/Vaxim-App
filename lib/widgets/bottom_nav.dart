import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vaxim/module/controller/app_controller.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/app_text.dart';
import 'package:vaxim/constants/size.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController navCtrl = Get.find();
    return Obx(
      () => Container(
        height: getScreenHeight(80),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        decoration: const BoxDecoration(
          color: Color(0xffFFFFFF),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              spreadRadius: 0,
              blurRadius: 15,
              color: Color.fromRGBO(0, 0, 0, 0.1),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: navBarItems.asMap().entries.map((e) {
            return InkWell(
              onTap: () {
                navCtrl.changeScreenPage(e.key);
              },
              child: AnimatedContainer(
                duration: 500.milliseconds,
                curve: Curves.ease,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      navCtrl.navBarIndex.value == e.key
                          ? e.value['active']!
                          : e.value['inactive']!,
                      height: getScreeWidth(24),
                      color:
                          navCtrl.navBarIndex.value == e.key ? kDark : kAppIcon,
                    ),
                    // getVerticalSpace(8),
                    // Text(
                    //   e.value['label']!,
                    //   style: TextStyle(
                    //     fontSize: getTextSize(14),
                    //     color: navCtrl.navBarIndex.value == e.key
                    //         ? kPrimary
                    //         : kIconText,
                    //     fontWeight: FontWeight.w500,
                    //     letterSpacing: 0.2,
                    //   ),
                    // )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
