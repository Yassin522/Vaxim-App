import 'package:flutter/material.dart';
import 'package:vaxim/constants/app_constants.dart';
import 'package:vaxim/constants/size.dart';

class PartnerBrand extends StatelessWidget {
  const PartnerBrand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenHeight(110),
      width: double.infinity,
      color: const Color(0xffFFFAF5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          partnerLogo.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(partnerLogo[index]),
          ),
        ),
      ),
    );
  }
}
