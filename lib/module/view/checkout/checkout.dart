import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/auth_controller.dart';
import 'package:vaxim/module/controller/cart_controller.dart';
import 'package:vaxim/module/model/cart_model.dart';
import 'package:vaxim/utils/helper/dialog.dart';
import 'package:vaxim/utils/services/strapi_payment.dart';
import 'package:vaxim/widgets/app_bar.dart';
import 'package:vaxim/widgets/custom_button.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  CartController cart = Get.find();
  AuthController auth = Get.find();

  final nameBox = GetStorage();
  final emailBox = GetStorage();
  final phoneBox = GetStorage();
  final addressBox = GetStorage();

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  getUserInfo() {
    nameController.text = nameBox.read("name") ?? "";
    emailController.text = nameBox.read("email") ?? "";
    phoneController.text = nameBox.read("phone") ?? "";
    addressController.text = nameBox.read("address") ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHelper.instance.buildAppBar(title: "Checkout"),
      body: LayoutBuilder(builder: (ctx, constraints) {
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    TextField(
                        controller: nameController,
                        decoration: const InputDecoration(hintText: "Name")),
                    getVerticalSpace(15),
                    TextField(
                        controller: emailController,
                        decoration: const InputDecoration(hintText: "Email")),
                    getVerticalSpace(15),
                    TextField(
                        controller: phoneController,
                        decoration:
                            const InputDecoration(hintText: "Phone No")),
                    getVerticalSpace(15),
                    TextField(
                        controller: addressController,
                        decoration: const InputDecoration(hintText: "Address")),
                    getVerticalSpace(15),
                  ],
                ),
              ),
              getVerticalSpace(8),
              CustomButton(
                text: "Proceed To Pay",
                press: () {
                  if (auth.isUserExists.value) {
                    checkout();
                  } else {
                    DialogHelper.instance.showMessage(
                      errorMessage: "User Not Found!",
                      message: "Please sign-in to make payment.",
                    );
                  }
                },
              )
            ],
          ),
        );
      }),
    );
  }

  void checkout() {
    if (nameController.text.isNotEmpty ||
        emailController.text.isNotEmpty ||
        phoneController.text.isNotEmpty ||
        addressController.text.isNotEmpty) {
      saveUserInfo();
      final customerInfo = Customer(
        fullname: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        address: addressController.text,
      );

      final userInfo = auth.authModel.value.user;

      cart.checkoutInfo = CheckoutModel(
        customer: customerInfo,
        products: cart.cartItemsList,
        total: cart.cartTotal + 15,
        user: userInfo,
      );
      payViaCard(amount: cart.cartTotal);
    }
  }

  void saveUserInfo() {
    nameBox.write("name", nameController.text);
    nameBox.write("email", emailController.text);
    nameBox.write("phone", phoneController.text);
    nameBox.write("address", addressController.text);
  }

  payViaCard({@required amount}) async {
    try {
      int _amount = (amount * 100).toInt();
      String totalAmount = _amount.toString();
      EasyLoading.show(status: "Please wait");
      final result = await PaymentService.instance
          .payWithNewCard(amount: totalAmount, currency: 'usd');
      EasyLoading.dismiss();
      if (result.success!) {
        EasyLoading.showSuccess("Order Placed Successfully");
      } else {
        // snackMessage(message: result.message);
        EasyLoading.showError(result.message.toString());
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      EasyLoading.dismiss();
    }
  }

  void snackMessage({@required message}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
