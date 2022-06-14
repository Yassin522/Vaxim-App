import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data_controller.dart';

class AppController extends GetxController {
  RxBool isRemember = false.obs;

  var navBarIndex = 0.obs;
  var detailsTabIndex = 0.obs;
  RxInt carousalIndex = 0.obs;
  RxInt saleCarousalIndex = 0.obs;
  RxInt homeTabIndex = 0.obs;
  RxInt categoryIndex = 0.obs;
  RxInt productTabIndex = 0.obs;
  RxString pageTitle = "Vaxim".obs;
  var colorIndex = 0.obs;
  var detailsImageIndex = 0.obs;
  PageController appPageCtrl =
      PageController(initialPage: 0, keepPage: false, viewportFraction: 1);

  PageController tabPageCtrl =
      PageController(initialPage: 0, keepPage: false, viewportFraction: 1);

  PageController productPageCtrl =
      PageController(initialPage: 0, keepPage: false, viewportFraction: 1);

  PageController catPageCtrl =
      PageController(initialPage: 0, keepPage: false, viewportFraction: 1);

  PageController detailsPageCtrl =
      PageController(initialPage: 0, keepPage: false, viewportFraction: 1);

  CarouselController carousalController = CarouselController();
  CarouselController saleCarousalCtrl = CarouselController();

  DataController data = Get.find();

  var flashEndTime =
      DateTime.now().add(const Duration(days: 2)).millisecondsSinceEpoch;

  @override
  onInit() {
    super.onInit();
    call();
  }

  call() {
    debugPrint("Check done");
  }

  @override
  dispose() {
    super.dispose();
    appPageCtrl.dispose();
    detailsPageCtrl.dispose();
    tabPageCtrl.dispose();
    catPageCtrl.dispose();
    productPageCtrl.dispose();
  }

  changeHomeTabPage(int v) {
    try {
      homeTabIndex(v);
      tabPageCtrl.animateToPage(v,
          duration: 300.milliseconds, curve: Curves.ease);

      update();
    } catch (e) {
      debugPrint(e.toString());
    }
    data.category.map((element) {
      if (element.name == data.categoryList[v]) {
        data.categoryItems.assignAll(element.products!.toList());
      }
    }).toList();
  }

  changeProductPage(int v) {
    try {
      productTabIndex(v);
      productPageCtrl.animateToPage(v,
          duration: 300.milliseconds, curve: Curves.ease);
      update();
    } catch (e) {
      debugPrint(e.toString());
    }

    data.category.map((element) {
      if (element.name == data.categoryList[v]) {
        data.categoryItems.assignAll(element.products!.toList());
      }
    }).toList();
  }

  changeCategoryPage(int v) {
    try {
      categoryIndex(v);
      catPageCtrl.animateToPage(v,
          duration: 300.milliseconds, curve: Curves.ease);
      update();
    } catch (e) {
      debugPrint(e.toString());
    }

    data.category.map((element) {
      if (element.name == data.categoryList[v]) {
        data.categoryItems.assignAll(element.products!.toList());
      }
    }).toList();
  }

  searchCategoryItems(String? cat) {
    data.category.map((element) {
      if (element.name == cat) {
        data.categorySearchItems.assignAll(element.products!.toList());
      }
    }).toList();
    update();
  }

  changeScreenPage(int v) {
    navBarIndex(v);
    appPageCtrl.animateToPage(v,
        duration: 300.milliseconds, curve: Curves.ease);
    switch (v) {
      case 0:
        pageTitle("Vaxim");
        break;
      case 1:
        pageTitle("Category");
        break;
      case 2:
        pageTitle("Your Cart");
        break;
      case 3:
        pageTitle("My Account");
        break;
      default:
        break;
    }
    update();
  }
}
