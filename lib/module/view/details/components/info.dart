import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/assets_path.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/app_controller.dart';
import 'package:vaxim/module/controller/cart_controller.dart';
import 'package:vaxim/module/controller/data_controller.dart';
import 'package:vaxim/module/view/details/components/qty_section.dart';
import 'package:vaxim/utils/helper/lazy_loader.dart';
import 'package:vaxim/utils/helper/show_snack.dart';
import 'package:vaxim/widgets/custom_button.dart';

import 'color_section.dart';

class Info extends StatelessWidget {
  const Info({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appCtrl = Get.find();
    CartController cart = Get.find();
    DataController data = Get.find();

    final v =
        cart.cartItemsList.where((e) => e.id == data.productDetails.value.id);
    if (v.isNotEmpty) {
      cart.itemExistsInCart(true);
      cart.cartCounter(v.first.quantity);
    } else {
      cart.itemExistsInCart(false);
      cart.cartCounter(1);
    }
    final wish =
        cart.wishItemsList.where((e) => e.id == data.productDetails.value.id);
    if (wish.isNotEmpty) {
      cart.itemExistsInWish(true);
    } else {
      cart.itemExistsInWish(false);
    }
    return Obx(() {
      return Container(
        color: const Color(0xffFFFFFF),
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          children: [
            SizedBox(
              height: getScreenHeight(417),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  SizedBox(
                      height: getScreenHeight(417),
                      child: PageView.builder(
                          itemCount:
                              data.productDetails.value.detailsImg!.length,
                          onPageChanged: (v) {
                            appCtrl.detailsImageIndex(v);
                          },
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: data.productDetails.value
                                      .detailsImg![index].url!,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    height: getScreenHeight(417),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      const ShimmerLoader(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ],
                            );
                          })),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.black.withOpacity(0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            data.productDetails.value.detailsImg!.length,
                            (index) => Container(
                              height: index == appCtrl.detailsImageIndex.value
                                  ? getScreeWidth(8)
                                  : getScreeWidth(6),
                              width: index == appCtrl.detailsImageIndex.value
                                  ? getScreeWidth(8)
                                  : getScreeWidth(12),
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                color: index == appCtrl.detailsImageIndex.value
                                    ? kGreen
                                    : Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              height: getScreeWidth(36),
                              width: getScreeWidth(36),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  backIcon,
                                  color: kGreyIcon,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: getScreeWidth(36),
                            width: getScreeWidth(36),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: SvgPicture.asset(
                                    cartOutline,
                                    color: kGreyIcon,
                                  ),
                                ),
                                Positioned(
                                  right: 3,
                                  top: 3,
                                  child: CircleAvatar(
                                    radius: 8,
                                    backgroundColor: kDark,
                                    child: FittedBox(
                                      child: Text(
                                        cart.cartItemsList.length.toString(),
                                        style: GoogleFonts.jost(
                                          color: Colors.white,
                                          fontSize: getTextSize(11),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            getVerticalSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.productDetails.value.title!,
                        style: GoogleFonts.jost(
                          fontWeight: FontWeight.w700,
                          fontSize: getTextSize(18),
                        ),
                      ),
                      GestureDetector(
                        onTap: cart.itemExistsInCart.value
                            ? () {
                                SnackMessage.instance.showSnack(
                                    message:
                                        "Can't add to wishlist, it's already added to cart.");
                              }
                            : () {
                                if (cart.itemExistsInWish.value) {
                                  cart.removeWishItem(
                                      data.productDetails.value.id!);
                                } else {
                                  cart.addToWishList(data.productDetails.value);
                                }
                              },
                        child: Container(
                          height: getScreeWidth(36),
                          width: getScreeWidth(36),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              cart.itemExistsInWish.value
                                  ? heartFillIcon
                                  : heartIcon,
                              color: kDark,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  getVerticalSpace(10),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        unratedColor: kAppIcon,
                        itemCount: 5,
                        itemSize: 16,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: kStar,
                        ),
                        onRatingUpdate: (rating) => debugPrint("$rating"),
                      ),
                      getHorizontalSpace(5),
                      Text(
                        "(325)",
                        style: TextStyle(
                          fontSize: getTextSize(14),
                          color: kLightText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  getVerticalSpace(10),
                  Text(
                    data.productDetails.value.shortDesc!,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: getTextSize(13),
                      letterSpacing: 0.3,
                    ),
                  ),
                  getVerticalSpace(15),
                  Text(
                    "\$ ${data.productDetails.value.currentPrice}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: getTextSize(16),
                      letterSpacing: 0.3,
                      color: kDark,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 20),
            const SelectColor(),
            const Divider(height: 20),
            const QtySection(),
            const Divider(height: 20),
            if (cart.itemExistsInCart.value)
              CustomButton(
                  text: "Added In Your Cart",
                  color: kDark,
                  textColor: Colors.white,
                  press: () {})
            else
              CustomButton(
                text: "Add To Cart",
                color: kDark,
                textColor: Colors.white,
                press: () {
                  cart.addToCart(data.productDetails.value);
                },
              ),
          ],
        ),
      );
    });
  }
}
