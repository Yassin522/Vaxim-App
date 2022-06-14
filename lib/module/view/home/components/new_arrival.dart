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

class NewArrivals extends StatelessWidget {
  const NewArrivals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController data = Get.find();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      margin: const EdgeInsets.only(top: 10),
      color: const Color(0xffFFFFFF),
      child: Column(
        children: [
          const HeaderText(text: "New Arrivals"),
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
            if (data.newArrivalItems.isEmpty) {
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
              return SizedBox(
                height: getScreenHeight(200),
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.newArrivalItems.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right:
                              index != data.newArrivalItems.length - 1 ? 10 : 0,
                        ),
                        child: ProductItem(
                          widthSize: 140,
                          item: data.newArrivalItems[index],
                          press: () {
                            data.productDetails(data.newArrivalItems[index]);
                            Get.toNamed(AppRoute.detailsPage);
                          },
                        ),
                      );
                    }),
              );
            }
          }),
        ],
      ),
    );
  }
}
