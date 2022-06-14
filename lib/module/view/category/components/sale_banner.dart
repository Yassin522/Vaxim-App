import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/app_controller.dart';
import 'package:vaxim/module/controller/data_controller.dart';
import 'package:vaxim/module/model/product_model.dart';

class SaleBanner extends StatefulWidget {
  const SaleBanner({Key? key}) : super(key: key);
  @override
  _SaleBannerState createState() => _SaleBannerState();
}

class _SaleBannerState extends State<SaleBanner> {
  @override
  Widget build(BuildContext context) {
    AppController appCtrl = Get.find();
    DataController data = Get.find();
    return Container(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 5),
      height: getScreenHeight(220),
      child: Column(
        // fit: StackFit.expand,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: getScreenHeight(180),
            width: getScreeWidth(335),
            decoration: BoxDecoration(
              color: const Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: CarouselSlider(
              items: data.onSellItems
                  .map((item) => BannerItem(item: item))
                  .toList(),
              carouselController: appCtrl.saleCarousalCtrl,
              options: CarouselOptions(
                autoPlay: true,
                initialPage: 0,
                viewportFraction: 1,
                autoPlayInterval: 10.seconds,
                reverse: false,
                aspectRatio: 1,
                onPageChanged: (index, reason) =>
                    appCtrl.saleCarousalIndex(index),
              ),
            ),
          ),
          SizedBox(
            height: getScreenHeight(30),
            child: dotIndicator(appCtrl, data),
          ),
        ],
      ),
    );
  }

  Widget dotIndicator(AppController appCtrl, DataController data) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: data.onSellItems
            .asMap()
            .entries
            .map(
              (entry) => Container(
                width: 6.0,
                height: 6.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: entry.key == appCtrl.saleCarousalIndex.value
                      ? kDark
                      : const Color(0xffC4C4C4),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class BannerItem extends StatelessWidget {
  const BannerItem({
    Key? key,
    this.item,
  }) : super(key: key);
  final ProductModel? item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.centerLeft,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: kDark,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            "15% Discount on",
                            style: GoogleFonts.jost(
                              fontSize: getTextSize(16),
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        getVerticalSpace(5),
                        Text(
                          item!.title!,
                          maxLines: 1,
                          style: GoogleFonts.jost(
                            fontSize: getTextSize(18),
                            fontWeight: FontWeight.w600,
                            color: kDark,
                          ),
                        ),
                        getVerticalSpace(8),
                        Text(
                          "\$ ${item!.currentPrice!}",
                          maxLines: 2,
                          style: GoogleFonts.jost(
                            fontSize: getTextSize(16),
                            fontWeight: FontWeight.w700,
                            color: kGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Image.network(
                  item!.detailsImg!.first.url!,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
