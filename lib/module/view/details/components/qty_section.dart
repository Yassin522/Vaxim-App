import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/cart_controller.dart';

class QtySection extends StatelessWidget {
  const QtySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cart = Get.find();
    // cart.cartCounter(1);
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(children: [
          Text(
            "Quantity",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: getTextSize(16),
              letterSpacing: 0.3,
              color: kGreyIcon,
            ),
          ),
          const Spacer(),
          QtyButton(
              icon: Icons.remove,
              press: () {
                cart.decrement();
              }),
          Container(
              height: getScreeWidth(30),
              width: getScreeWidth(30),
              decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      color: Color.fromRGBO(0, 0, 0, 0.05),
                    )
                  ]),
              alignment: Alignment.center,
              child: Text(
                "${cart.cartCounter.value}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: getTextSize(16),
                  letterSpacing: 0.3,
                  color: kGreyIcon,
                ),
              )),
          QtyButton(
              icon: Icons.add,
              press: () {
                cart.increment();
              }),
        ]),
      );
    });
  }
}

class QtyButton extends StatelessWidget {
  const QtyButton({
    Key? key,
    this.press,
    this.icon,
  }) : super(key: key);
  final VoidCallback? press;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: getScreeWidth(30),
        width: getScreeWidth(30),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: const Color(0xffE5E5E5),
            borderRadius: BorderRadius.circular(6),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 4,
                color: Color.fromRGBO(0, 0, 0, 0.05),
              )
            ]),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 15,
        ),
      ),
    );
  }
}
