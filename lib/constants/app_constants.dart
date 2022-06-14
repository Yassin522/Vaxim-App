import 'package:flutter/material.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/core/account.dart';
import 'package:vaxim/module/model/banner_model.dart';
import 'package:vaxim/module/view/cart/cart.dart';
import 'package:vaxim/module/view/category/category.dart';
import 'package:vaxim/module/view/home/home.dart';

import 'assets_path.dart';

List<Widget> screenPages = const [
  HomePage(),
  CategoryPage(),
  CartPage(),
  AccountPage(),
];

List<Color> itemColor = [
  kPrimary,
  kBrownColor,
  kGreyIcon,
];

List<String> detailsTab = ['Description', 'Specification', 'Ratings & Review'];
List<BannerModel> bannerList = [
  BannerModel(
    title: 'All Premium\nQualityTools',
    offerText: 'Big Sale Offer',
    imgUrl: banner1,
  ),
  BannerModel(
    title: 'New Powerfull\nDrill Machine',
    offerText: 'Popular in 2020',
    imgUrl: banner2,
  ),
  BannerModel(
    title: 'All Premium\nQualityTools',
    offerText: 'Big Sale Offer',
    imgUrl: banner1,
  ),
  BannerModel(
    title: 'New Powerfull\nDrill Machine',
    offerText: 'Popular in 2020',
    imgUrl: banner2,
  ),
  BannerModel(
    title: 'All Premium\nQualityTools',
    offerText: 'Big Sale Offer',
    imgUrl: banner1,
  ),
  BannerModel(
    title: 'New Powerfull\nDrill Machine',
    offerText: 'Popular in 2020',
    imgUrl: banner2,
  ),
];

InputDecoration buildCredentialDecoration({@required hintText, icon}) {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: const BorderSide(
      width: 0.5,
      color: kPrimary,
    ),
  );
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      color: const Color(0xffAFAFAF),
      fontWeight: FontWeight.w400,
      fontSize: getTextSize(16),
    ),
    fillColor: const Color(0xff141414).withOpacity(0.7),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: outlineInputBorder,
    border: outlineInputBorder,
    focusedBorder: outlineInputBorder.copyWith(
      borderSide: const BorderSide(
        color: kPrimary,
        width: 0.5,
      ),
    ),
  );
}

List<String> partnerLogo = [
  "assets/images/partner1.jpg",
  "assets/images/partner2.jpg",
  "assets/images/partner3.jpg",
];
