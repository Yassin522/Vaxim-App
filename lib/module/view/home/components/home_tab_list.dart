import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaxim/config/routes.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/app_controller.dart';
import 'package:vaxim/module/controller/data_controller.dart';
import 'package:vaxim/utils/helper/lazy_loader.dart';
import 'package:vaxim/widgets/product_item.dart';

class HomeTabProducts extends StatelessWidget {
  const HomeTabProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appCtrl = Get.find();
    DataController data = Get.find();
    return ExpandablePageView.builder(
      itemCount: data.categoryList.length,
      controller: appCtrl.tabPageCtrl,
      onPageChanged: appCtrl.homeTabIndex,
      animationDuration: 500.milliseconds,
      animationCurve: Curves.ease,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, index) {
        return Obx(() {
          if (data.isLoading.value) {
            return Wrap(
              spacing: 15,
              runSpacing: 15,
              alignment: WrapAlignment.center,
              children: List.generate(4, (index) {
                return SizedBox(
                  height: getScreenHeight(200),
                  width: getScreeWidth(160),
                  child: const ShimmerLoader(),
                );
              }),
            );
          }
          if (data.categoryItems.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Products Not Available!",
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(14),
                    color: kLightText,
                  ),
                ),
              ),
            );
          } else {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              color: const Color(0xffFFFFFF),
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                alignment: WrapAlignment.start,
                children: List.generate(
                    data.categoryItems.length < 4
                        ? data.categoryItems.length
                        : 4, (index) {
                  return ProductItem(
                    item: data.categoryItems[index],
                    press: () {
                      data.productDetails(data.categoryItems[index]);
                      Get.toNamed(AppRoute.detailsPage);
                    },
                  );
                }),
              ),
            );
          }
        });
      },
    );
  }
}
