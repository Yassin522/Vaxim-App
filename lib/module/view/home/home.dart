import 'package:flutter/material.dart';
import 'package:vaxim/module/view/home/components/banner_slider.dart';
import 'package:vaxim/module/view/home/components/best_selling.dart';
import 'package:vaxim/module/view/home/components/home_tab_list.dart';
import 'package:vaxim/module/view/home/components/new_arrival.dart';
import 'package:vaxim/module/view/home/components/partner_brand.dart';
import 'package:vaxim/module/view/home/components/tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 15),
      children: const [
        BannerPanel(),
        HomeTab(),
        HomeTabProducts(),
        BestSelling(),
        NewArrivals(),
        PartnerBrand(),
      ],
    );
  }
}
