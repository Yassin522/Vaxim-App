import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaxim/module/controller/app_controller.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/app_constants.dart';
import 'package:vaxim/constants/assets_path.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/cart_controller.dart';
import 'package:vaxim/widgets/bottom_nav.dart';
import 'package:vaxim/widgets/menu_drawer.dart';
import 'package:vaxim/widgets/search_delegate.dart';

class LandPage extends StatelessWidget {
  const LandPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>();
    return Scaffold(
      endDrawer: const MenuDrawer(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (ctx, constrains) {
            return SizedBox(
              height: constrains.maxHeight,
              child: GetBuilder<AppController>(
                init: AppController(),
                builder: (app) => Column(
                  children: [
                    const AppHeader(),
                    Expanded(
                      child: PageView.builder(
                        itemCount: screenPages.length,
                        controller: app.appPageCtrl,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return screenPages[app.navBarIndex.value];
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController app = Get.find();
    return Container(
      height: getScreenHeight(60),
      width: double.infinity,
      alignment: Alignment.center,
      color: kAppBgColor,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() {
            return Text(
              "${app.pageTitle}",
              style: app.navBarIndex.value == 0
                  ? GoogleFonts.jost(
                      color: kDark,
                      fontSize: getTextSize(24),
                      fontWeight: FontWeight.w800,
                    )
                  : GoogleFonts.jost(
                      color: kDark,
                      fontSize: getTextSize(16),
                      fontWeight: FontWeight.w800,
                    ),
            );
          }),
          const Spacer(),
          Obx(() {
            return Visibility(
              visible: app.navBarIndex.value != 3,
              child: GestureDetector(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearch(),
                  );
                },
                child: Container(
                  height: getScreeWidth(36),
                  width: getScreeWidth(36),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset(
                    searchIcon,
                    color: kGreyIcon,
                  ),
                ),
              ),
            );
          }),
          getHorizontalSpace(10),
          Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              child: Container(
                height: getScreeWidth(36),
                width: getScreeWidth(36),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  menuIcon,
                  color: kGreyIcon,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
