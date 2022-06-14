import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/assets_path.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/cart_controller.dart';
import 'package:vaxim/module/model/cart_model.dart';

class WishItem extends StatelessWidget {
  const WishItem({
    Key? key,
    this.item,
    this.index,
  }) : super(key: key);
  final CartListItems? item;
  final int? index;

  @override
  Widget build(BuildContext context) {
    CartController cart = Get.find();
    return Container(
      height: getScreenHeight(100),
      width: getScreeWidth(345),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.network(item!.productImage!),
          getHorizontalSpace(10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item!.title!,
                          maxLines: 2,
                          style: GoogleFonts.rubik(
                            fontSize: getTextSize(14),
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                            color: kDark,
                          ),
                        ),
                        getVerticalSpace(8),
                        Text(
                          "\$${item!.price}",
                          style: GoogleFonts.rubik(
                            fontSize: getTextSize(14),
                            fontWeight: FontWeight.w500,
                            color: kLightText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  getHorizontalSpace(8),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          cart.addToCartFromWish(index!);
                        },
                        child: SvgPicture.asset(
                          cartOutline,
                          height: getScreeWidth(20),
                        ),
                      ),
                      getHorizontalSpace(10),
                      InkWell(
                        onTap: () {
                          cart.removeWishItem(item!.id!);
                        },
                        radius: 5,
                        child: SvgPicture.asset(
                          deleteIcon,
                          height: getScreeWidth(20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          getHorizontalSpace(5),
        ],
      ),
    );
  }
}
