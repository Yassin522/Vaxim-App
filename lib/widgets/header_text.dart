import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaxim/config/routes.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/size.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key, this.text}) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Row(
        children: [
          Text(
            text!,
            style: TextStyle(
              fontSize: getTextSize(17),
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoute.productPage);
            },
            child: Text(
              "View All",
              style: TextStyle(
                fontSize: getTextSize(14),
                color: kBrownColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          getHorizontalSpace(5),
          const Icon(
            Icons.arrow_forward_ios,
            size: 11,
            color: kBrownColor,
          ),
        ],
      ),
    );
  }
}
