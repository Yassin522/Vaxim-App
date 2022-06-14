import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaxim/config/routes.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/assets_path.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/cart_controller.dart';
import 'package:vaxim/widgets/custom_button.dart';
import 'components/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cart = Get.find();
    
    return LayoutBuilder(
      builder: (context, constraints) {
        return Obx(() {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (cart.cartItemsList.isEmpty)
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            cartIcon,
                            height: 50,
                          ),
                          getVerticalSpace(15),
                          Text(
                            "Empty",
                            style: GoogleFonts.jost(
                              fontSize: getTextSize(18),
                              color: kLightText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (cart.cartItemsList.isNotEmpty)
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: constraints.maxHeight -
                                constraints.maxHeight * 0.2,
                            child: ListView(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 15, bottom: 15),
                              children: [
                                ...List.generate(
                                  cart.cartItemsList.length,
                                  (index) => CartItem(
                                    item: cart.cartItemsList[index],
                                    index: index,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: getScreenHeight(50),
                          width: double.infinity,
                          color: kDark,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Total: ",
                                  style: GoogleFonts.jost(
                                    fontSize: getTextSize(15),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  )),
                              Text("\$ " + cart.cartTotal.toString(),
                                  style: GoogleFonts.jost(
                                      fontSize: getTextSize(15),
                                      fontWeight: FontWeight.w700,
                                      color: kPrimary)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: CustomButton(
                              press: () {
                                Get.toNamed(AppRoute.checkoutPage);
                              },
                              text: "Proceed To Checkout",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        });
      },
    );
  }
}
