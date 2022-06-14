import 'package:flutter/material.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/view/category/components/sale_banner.dart';
import 'package:vaxim/widgets/header_text.dart';

class OnSell extends StatelessWidget {
  const OnSell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFFFFFF),
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HeaderText(text: "Products On Sale"),
          getVerticalSpace(15),
          const SaleBanner(),
        ],
      ),
    );
  }
}
