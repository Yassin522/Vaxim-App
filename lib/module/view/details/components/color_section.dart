import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/app_constants.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/app_controller.dart';

class SelectColor extends StatelessWidget {
  const SelectColor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appCtrl = Get.find();
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              "Select Color",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: getTextSize(16),
                letterSpacing: 0.3,
                color: kGreyIcon,
              ),
            ),
            const Spacer(),
            ...List.generate(
              itemColor.length,
              (index) => GestureDetector(
                onTap: () {
                  appCtrl.colorIndex(index);
                },
                child: Container(
                  height: getScreeWidth(33),
                  width: getScreenHeight(33),
                  padding: const EdgeInsets.all(3),
                  margin: const EdgeInsets.only(right: 5),
                  decoration: appCtrl.colorIndex.value == index
                      ? BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: itemColor[index],
                          ))
                      : null,
                  child: Container(
                    height: getScreeWidth(25),
                    width: getScreenHeight(25),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: itemColor[index],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
