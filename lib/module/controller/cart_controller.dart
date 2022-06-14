import 'package:get/get.dart';
import 'package:vaxim/module/model/cart_model.dart';
import 'package:vaxim/module/model/product_model.dart';
import 'package:vaxim/utils/helper/show_snack.dart';

class CartController extends GetxController {
  var itemExistsInCart = false.obs;
  var itemExistsInWish = false.obs;
  var cartCounter = 1.obs;
  var cartItemsList = <CartListItems>[].obs;
  var wishItemsList = <CartListItems>[].obs;
  double get cartTotal => cartItemsList.fold(
      0.0, (sum, element) => sum + element.quantity! * element.price!);

  var checkoutInfo = CheckoutModel();

  addToCart(ProductModel item) {
    try {
      final data = item.toJson();
      itemExistsInCart(true);
      cartItemsList.add(CartListItems.fromJson(data, cartCounter.value));
      final v = wishItemsList.where((e) => e.id == item.id);
      if (v.isNotEmpty) removeWishItem(item.id!);
      SnackMessage.instance.showSnack(message: 'Item added to cart');
      update();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  addToWishList(ProductModel item) {
    try {
      cartCounter(1);
      final data = item.toJson();
      itemExistsInWish(true);
      wishItemsList.add(CartListItems.fromJson(data, cartCounter.value));
      update();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  increment() {
    cartCounter++;
    update();
  }

  decrement() {
    if (cartCounter.value != 1) {
      cartCounter--;
    }
    update();
  }

  removeCartItem(int index) {
    cartItemsList.removeAt(index);
    SnackMessage.instance.showSnack(message: 'Removed');
    update();
  }

  removeWishItem(int id) {
    wishItemsList.removeWhere((element) => element.id == id);
    itemExistsInWish(false);
    update();
  }

  addToCartFromWish(int index) {
    cartItemsList.add(wishItemsList[index]);
    wishItemsList.removeAt(index);
    SnackMessage.instance.showSnack(message: 'Item added to cart');
  }
}
