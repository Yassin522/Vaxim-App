import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaxim/config/routes.dart';
import 'package:vaxim/module/controller/app_controller.dart';
import 'package:vaxim/module/controller/auth_controller.dart';
import '../constants/app_color.dart';
import '../constants/assets_path.dart';
import '../constants/size.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppController appCtrl = Get.find();
    AuthController auth = Get.find();
    // CartController cart = Get.find();
    return Drawer(
      child: Obx(() {
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 25),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(drawerBgImage),
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.8),
                      BlendMode.darken,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        child: Text(
                      "Vaxim",
                      style: GoogleFonts.jost(
                        color: Colors.white,
                        fontSize: getTextSize(30),
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                    getVerticalSpace(2),
                    Text(
                      "Clothing Brand".capitalize!,
                      style: GoogleFonts.oswald(
                        fontSize: getTextSize(12),
                        fontWeight: FontWeight.w400,
                        color: kOffWhite,
                        letterSpacing: 1.8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DrawerItem(
              title: "Home",
              icon: drawerIcon,
              press: () {
                if (appCtrl.navBarIndex.value == 0) {
                  Get.back();
                } else {
                  Get.back();
                  // appCtrl.changePage(0);
                }
              },
            ),
            const CustomDivider(),
            DrawerItem(
                title: "Products",
                icon: productIcon,
                press: () {
                  Get.offAndToNamed(AppRoute.productPage);
                }),
            const CustomDivider(),
            DrawerItem(
                title: "My Orders",
                icon: orderBagIcon,
                press: () {
                  Get.offAndToNamed(AppRoute.orderPage);
                }),
            const CustomDivider(),
            DrawerItem(
                title: "Wishlist",
                icon: heartIcon,
                press: () {
                  Get.offAndToNamed(AppRoute.wishlistPage);
                }),
            const CustomDivider(),
            DrawerItem(
              title: "About",
              icon: aboutIcon,
              press: () {
                Get.offAndToNamed(AppRoute.aboutPage);
              },
            ),
            const CustomDivider(),
            DrawerItem(
              title: "Terms & Conditions",
              icon: conditionsIcon,
              press: () {
                Get.offAndToNamed(AppRoute.conditionPage);
              },
            ),
            if (auth.isUserExists.value)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomDivider(),
                  DrawerItem(
                    title: "Sign Out",
                    icon: logoutIcon,
                    textColor: kRed,
                    press: () {
                      final box = GetStorage();
                      auth.isUserExists(false);
                      box.write('token', null);
                      box.write('id', null);
                      auth.authModel(null);
                      Get.back();
                    },
                  ),
                ],
              ),
            if (!auth.isUserExists.value)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomDivider(),
                  DrawerItem(
                    title: "LogIn",
                    icon: loginIcon,
                    textColor: Colors.green[600],
                    press: () {
                      Get.offAndToNamed(AppRoute.authPage);
                    },
                  ),
                ],
              ),
            // const CustomDivider(),
          ],
        );
      }),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key, this.title, this.press, this.icon, this.textColor = kDark})
      : super(key: key);
  final String? title;
  final VoidCallback? press;
  final String? icon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      leading: SvgPicture.asset(
        icon!,
        color: textColor,
        // height: getScreeWidth(20),
        // width: getScreeWidth(20),
      ),
      title: Text(
        title!,
        style: GoogleFonts.jost(
          fontSize: getTextSize(15),
          fontWeight: FontWeight.w500,
          color: kDark,
          height: 0.7,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 10),
      onTap: press,
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Divider(
        indent: 20,
        height: 10,
      );
}
