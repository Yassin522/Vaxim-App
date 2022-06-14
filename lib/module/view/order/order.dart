import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/auth_controller.dart';
import 'package:vaxim/module/controller/data_controller.dart';
import 'package:vaxim/utils/helper/lazy_loader.dart';

import 'components/order_item.dart';
import 'components/order_title.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find();
    DataController data = Get.find();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: getScreeWidth(70),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            height: getScreeWidth(36),
            width: getScreeWidth(36),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: kDark,
            ),
          ),
        ),
        title: Text(
          "Order History",
          style: TextStyle(
            color: kDark,
            fontSize: getTextSize(16),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: GetBuilder<DataController>(
                init: DataController(),
                builder: (order) {
                  if (!auth.isUserExists.value) {
                    return Center(
                      child: Text(
                        "You're not logged in".capitalize!,
                        style: TextStyle(
                          fontSize: getTextSize(18),
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    );
                  } else if (order.orderLoading.value) {
                    return SizedBox(
                      height: ResponsiveSize.screenHeight,
                      width: ResponsiveSize.screenWidth,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (ctx, index) {
                          return const ListTile(
                            contentPadding: EdgeInsets.all(10),
                            title: ShimmerLoader(height: 20),
                            subtitle: Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: ShimmerLoader(height: 30, width: 50),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (data.myOrders.isEmpty) {
                    return Center(
                      child: Text(
                        "No Order Placed Yet",
                        style: TextStyle(
                          fontSize: getTextSize(16),
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    );
                  } else {
                    return ListView.separated(
                      itemCount: order.myOrders.length,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      separatorBuilder: (ctx, index) => getVerticalSpace(10),
                      itemBuilder: (ctx, index) {
                        final element = order.myOrders[index];
                        final orderDate = DateFormat.yMd()
                            .format(DateTime.parse(element.createdAt!));

                        return Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            tilePadding:
                                const EdgeInsets.symmetric(horizontal: 5),
                            leading: OrderIndex(orderDate: orderDate),
                            collapsedIconColor: kPrimary,
                            controlAffinity: ListTileControlAffinity.trailing,
                            iconColor: kPrimary,
                            backgroundColor: Colors.white,
                            collapsedBackgroundColor: Colors.white,
                            childrenPadding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            title: const Text(''),
                            children: [
                              // TotalAndEmail(element: element),
                              TotalAndEmail(element: element),
                              ...List.generate(
                                element.products!.length,
                                (index) {
                                  // final item = element.orderItems![index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    child: OrderItem(
                                      item: element.products![index],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                }),
          );
        },
      ),
    );
  }
}
