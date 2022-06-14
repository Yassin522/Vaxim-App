import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaxim/config/routes.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/data_controller.dart';
import 'package:vaxim/utils/helper/lazy_loader.dart';
import 'package:vaxim/widgets/product_item.dart';

class SearchCategoryItems extends StatelessWidget {
  const SearchCategoryItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController data = Get.find();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: getScreeWidth(70),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            height: getScreeWidth(36),
            width: getScreeWidth(36),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: kDark,
            ),
          ),
        ),
        title: Text(
          "Related Products",
          style: TextStyle(
            color: kDark,
            fontSize: getTextSize(16),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Obx(() {
        if (data.isLoading.value) {
          return Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: List.generate(4, (index) {
              return SizedBox(
                height: getScreenHeight(250),
                width: getScreeWidth(165),
                child: const ShimmerLoader(),
              );
            }),
          );
        }
        if (data.categorySearchItems.isEmpty) {
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
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            children: [
              Wrap(
                spacing: 15,
                runSpacing: 15,
                children:
                    List.generate(data.categorySearchItems.length, (index) {
                  return Container(
                    height: getScreenHeight(200),
                    width: getScreeWidth(160),
                    decoration: const BoxDecoration(
                      color: Color(0xffFFFFFF),
                    ),
                    child: ProductItem(
                      item: data.categorySearchItems[index],
                      press: () {
                        data.productDetails(data.categorySearchItems[index]);
                        Get.toNamed(AppRoute.detailsPage);
                      },
                    ),
                  );
                }),
              ),
            ],
          );
        }
      }),
    );
  }
}
