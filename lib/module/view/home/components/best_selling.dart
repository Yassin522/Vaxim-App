import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaxim/config/routes.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/data_controller.dart';
import 'package:vaxim/utils/helper/lazy_loader.dart';
import 'package:vaxim/widgets/header_text.dart';
import 'package:vaxim/widgets/product_item.dart';

class BestSelling extends StatelessWidget {
  const BestSelling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController data = Get.find();
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 15),
      color: const Color(0xffFFFFFF),
      child: Column(
        children: [
          const HeaderText(text: "Best Selling"),
          getVerticalSpace(10),
          Obx(() {
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
            if (data.bestSellerItems.isEmpty) {
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
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  alignment: WrapAlignment.start,
                  children: List.generate(
                      data.bestSellerItems.length < 4
                          ? data.bestSellerItems.length
                          : 4, (index) {
                    return ProductItem(
                      item: data.bestSellerItems[index],
                      press: () {
                        data.productDetails(data.bestSellerItems[index]);
                        Get.toNamed(AppRoute.detailsPage);
                      },
                    );
                  }),
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
