import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vaxim/module/model/cat_model.dart';
import 'package:vaxim/module/model/my_order_model.dart';
import 'package:vaxim/module/model/product_model.dart';
import 'package:vaxim/utils/services/api/data_service.dart';

import 'base_controller.dart';

class DataController extends GetxController with BaseController {
  RxBool isLoading = false.obs;
  RxBool orderLoading = false.obs;
  var productData = <ProductModel>[].obs;
  var category = <CatModel>[].obs;
  var categoryList = <String>["All"].obs;
  var categoryItems = <ProductModel>[].obs;
  var categorySearchItems = <ProductModel>[].obs;
  var bestSellerItems = <ProductModel>[].obs;
  var newArrivalItems = <ProductModel>[].obs;
  var onSellItems = <ProductModel>[].obs;
  var hotItems = <ProductModel>[].obs;
  var errorMsg = "".obs;
  var productDetails = ProductModel().obs;
  var myOrders = <MyOrderModel>[].obs;
  final box = GetStorage();
  int? userId;

  @override
  void onInit() {
    super.onInit();
    productController();
    categoryController();
    userId = box.read('id');
    // ignore: avoid_print
    print("user-id: $userId");
    if (userId != null) {
      getMyOrder();
    }
  }

  Future productController() async {
    try {
      isLoading(true);
      final result = await DataService.instance.getAllProduct();
      // ignore: avoid_print
      print(result['code']);
      if (result['code'] == 200) {
        productData.assignAll(result['data']);

        productData.map((element) {
          if (element.bestSelling == true) {
            bestSellerItems.add(element);
          }
          if (element.newArrival == true) {
            newArrivalItems.add(element);
          }
          if (element.onSell == true) {
            onSellItems.add(element);
          }
          if (element.hot == true) {
            hotItems.add(element);
          }
        }).toList();
      } else {
        errorMsg.value = result['data'];
      }
      update();
    } catch (e) {
      handleError(e);
    } finally {
      isLoading(false);
    }
  }

  Future categoryController() async {
    try {
      isLoading(true);
      final result = await DataService.instance.getCategory();
      // ignore: avoid_print
      print(result['code']);
      if (result['code'] == 200) {
        category.assignAll(result['data']);
        categoryItems.assignAll(category.first.products!.toList());
        category.map((e) {
          categoryList.add(e.name.toString());
        }).toList();

        // ignore: avoid_print
        print(result['code']);
        // debugPrint("$productData");
      } else {
        errorMsg.value = result['data'];
      }
      update();
    } catch (e) {
      handleError(e);
    } finally {
      isLoading(false);
    }
  }

  Future getMyOrder() async {
    try {
      orderLoading(true);
      final result = await DataService.instance.orderService(id: userId);
      if (result['code'] == 200) {
        myOrders.assignAll(result['data']);
      } else {
        errorMsg.value = result['data']['message'];
      }
      update();
    } catch (e) {
      handleError(e);
    } finally {
      orderLoading(false);
    }
  }
}
