import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/app_constants.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/app_controller.dart';
import 'package:vaxim/module/model/banner_model.dart';

class BannerPanel extends StatefulWidget {
  const BannerPanel({Key? key}) : super(key: key);
  @override
  _BannerPanelState createState() => _BannerPanelState();
}

class _BannerPanelState extends State<BannerPanel> {
  @override
  Widget build(BuildContext context) {
    AppController appController = Get.find();
    return Container(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 10, bottom: 0),
      margin: const EdgeInsets.only(bottom: 10),
      height: getScreenHeight(210),
      color: const Color(0xffFFFFFF),
      child: Column(
        // fit: StackFit.expand,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: getScreenHeight(160),
            width: getScreeWidth(335),
            child: CarouselSlider(
              items: bannerList.map((item) => BannerItem(item: item)).toList(),
              carouselController: appController.carousalController,
              options: CarouselOptions(
                autoPlay: true,
                initialPage: 0,
                viewportFraction: 1,
                autoPlayInterval: 3.seconds,
                reverse: false,
                aspectRatio: 1,
                onPageChanged: (index, reason) =>
                    appController.carousalIndex(index),
              ),
            ),
          ),
          SizedBox(
            height: getScreenHeight(30),
            child: dotIndicator(appController),
          ),
        ],
      ),
    );
  }

  Widget dotIndicator(AppController appController) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: bannerList
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
                  color: entry.key == appController.carousalIndex.value
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
  final BannerModel? item;

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
            child: Image.asset(
              "${item!.imgUrl}",
              fit: BoxFit.fill,
            ),
          ),
        ),
        // Positioned(
        //   top: 20,
        //   left: 20,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         "${item!.offerText}",
        //         style: TextStyle(
        //           color: kRed,
        //           fontSize: getTextSize(16),
        //           fontWeight: FontWeight.w400,
        //         ),
        //       ),
        //       getVerticalSpace(6),
        //       Text(
        //         "${item!.title}",
        //         style: GoogleFonts.rubik(
        //           color: kDark,
        //           fontSize: getTextSize(18),
        //           fontWeight: FontWeight.w700,
        //           fontStyle: FontStyle.normal,
        //           height: 1.5,
        //           letterSpacing: 0.3,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
