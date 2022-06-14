import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/cart_controller.dart';

import 'components/wish_item.dart';

class WishPage extends StatelessWidget {
  const WishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cart = Get.put(CartController());
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
          "Wishlist",
          style: TextStyle(
            color: kDark,
            fontSize: getTextSize(16),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Obx(() {
              return ListView(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 15, bottom: 15),
                children: [
                  ...List.generate(
                    cart.wishItemsList.length,
                    (index) => WishItem(
                      item: cart.wishItemsList[index],
                      index: index,
                    ),
                  ),
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
