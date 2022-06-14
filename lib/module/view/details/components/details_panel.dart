import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/app_constants.dart';

import 'package:vaxim/constants/app_text.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/app_controller.dart';
import 'package:vaxim/module/controller/data_controller.dart';

class DetailsPanel extends StatelessWidget {
  const DetailsPanel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppController appCtrl = Get.find();
    DataController data = Get.find();
    appCtrl.detailsTabIndex(0);
    return Container(
      color: const Color(0xffFFFFFF),
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Tab
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: List.generate(
                  detailsTab.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        appCtrl.detailsPageCtrl.animateToPage(
                          index,
                          duration: 500.milliseconds,
                          curve: Curves.ease,
                        );
                      },
                      child: Container(
                        height: getScreenHeight(45),
                        // width: getScreeWidth(110),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: appCtrl.detailsTabIndex.value == index
                              ? kDark
                              : const Color(0xffF7F7F7),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            right: index != detailsTab.length - 1 ? 10 : 0),
                        child: Text(
                          detailsTab[index],
                          style: TextStyle(
                            color: index == appCtrl.detailsTabIndex.value
                                ? Colors.white
                                : kGreyIcon,
                            fontWeight: FontWeight.w700,
                            fontSize: getTextSize(16),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            getVerticalSpace(20),

            //Tab Items
            ExpandablePageView.builder(
              itemCount: detailsTab.length,
              controller: appCtrl.detailsPageCtrl,
              onPageChanged: appCtrl.detailsTabIndex,
              animationDuration: 500.milliseconds,
              animationCurve: Curves.ease,
              animateFirstPage: false,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (index == 0)
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            data.productDetails.value.longDesc!,
                            // textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: getTextSize(14),
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.17,
                              height: 1.7,
                            ),
                          ),
                        ),
                      if (index == 1) const Specifications(),
                      if (index == 2) const ReviewAndRatings(),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      }),
    );
  }
}

class ReviewAndRatings extends StatelessWidget {
  const ReviewAndRatings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController data = Get.find();
    return Column(
      children: [
        if (data.productDetails.value.reviews!.isEmpty)
          Center(
            child: Text(
              "No Review".capitalize!,
              style: Get.textTheme.caption,
            ),
          ),
        if (data.productDetails.value.reviews!.isNotEmpty)
          ...List.generate(
            data.productDetails.value.reviews!.length,
            (index) => Column(
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text:
                            "${data.productDetails.value.reviews![index].name} - ",
                        style: descriptionText(),
                        children: [
                          TextSpan(
                            text: DateFormat.yMMMMd().format(DateTime.now()),
                            style: descriptionText(),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    RatingBar.builder(
                      initialRating: data
                          .productDetails.value.reviews![index].ratings!
                          .toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      unratedColor: kAppIcon,
                      itemCount: 5,
                      itemSize: 14,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: kStar,
                      ),
                      ignoreGestures: true,
                      onRatingUpdate: (rating) => debugPrint("$rating"),
                    ),
                  ],
                ),
                getVerticalSpace(10),
                Text(
                  data.productDetails.value.reviews![index].feedback!,
                  style: TextStyle(
                    fontSize: getTextSize(12),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                    height: 1.8,
                  ),
                ),
                if (index + 1 < data.productDetails.value.reviews!.length)
                  Divider(
                    height: getScreenHeight(45),
                  ),
              ],
            ),
          )
      ],
    );
  }

  TextStyle descriptionText() {
    return TextStyle(
      fontSize: getTextSize(12),
      fontWeight: FontWeight.w400,
      color: kIconText,
      letterSpacing: 0.3,
      height: 1.5,
    );
  }
}

class Specifications extends StatelessWidget {
  const Specifications({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          additionalInfo.length,
          (index) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      additionalInfo[index]['name']!,
                      style: TextStyle(
                        fontSize: getTextSize(14),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(additionalInfo[index]['value']!)
                  ],
                ),
              ),
              const Divider(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
