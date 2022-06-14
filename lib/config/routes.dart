import 'package:get/get.dart';
import 'package:vaxim/core/auth/auth_page.dart';
import 'package:vaxim/module/view/checkout/checkout.dart';
import 'package:vaxim/module/view/details/details.dart';
import 'package:vaxim/module/view/land.dart';
import 'package:vaxim/module/view/order/order.dart';
import 'package:vaxim/module/view/others/about.dart';
import 'package:vaxim/module/view/others/conditions.dart';
import 'package:vaxim/module/view/products/components/search_item_page.dart';
import 'package:vaxim/module/view/products/products.dart';
import 'package:vaxim/module/view/splash.dart';
import 'package:vaxim/module/view/wish/wish.dart';

class AppRoute {
  AppRoute._();
  static final AppRoute _instance = AppRoute._();
  static AppRoute get instance => _instance;
  static const String splashPage = "/splash";
  static const String landPage = "/land";
  static const String authPage = "/auth";
  static const String checkoutPage = "/checkout";
  static const String detailsPage = "/details";
  static const String productPage = "/product";
  static const String orderPage = "/order";
  static const String aboutPage = "/about";
  static const String conditionPage = "/condition";
  static const String wishlistPage = "/wishlist";
  static const String searchPage = "/search_page";

  static List<GetPage> getPage = [
    GetPage(name: splashPage, page: () => const Splash()),
    GetPage(name: landPage, page: () => const LandPage()),
    GetPage(name: authPage, page: () => const AuthPage()),
    GetPage(name: detailsPage, page: () => const ProductDetails()),
    GetPage(name: wishlistPage, page: () => const WishPage()),
    GetPage(name: orderPage, page: () => const OrderPage()),
    GetPage(name: productPage, page: () => const ProductPage()),
    GetPage(name: checkoutPage, page: () => const CheckoutPage()),
    GetPage(name: searchPage, page: () => const SearchCategoryItems()),
    GetPage(name: aboutPage, page: () => const AboutPage()),
    GetPage(name: conditionPage, page: () => const ConditionPage()),
  ];
}
