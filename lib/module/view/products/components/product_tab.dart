import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/app_controller.dart';
import 'package:vaxim/module/controller/data_controller.dart';

class ProductTab extends StatelessWidget {
  const ProductTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appCtrl = Get.find();
    DataController data = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          child: Obx(
            () {
              return Row(
                children: [
                  ...List.generate(
                    data.categoryList.length,
                    (index) => GestureDetector(
                      onTap: () {
                        appCtrl.changeProductPage(index);
                      },
                      child: Container(
                        height: getScreenHeight(35),
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: index == appCtrl.productTabIndex.value
                                ? kDark
                                : const Color(0xffF7F7F7),
                            borderRadius: BorderRadius.circular(7)),
                        child: Text(
                          data.categoryList[index],
                          style: TextStyle(
                            color: index == appCtrl.productTabIndex.value
                                ? Colors.white
                                : kGreyIcon,
                            fontWeight: index == appCtrl.productTabIndex.value
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
