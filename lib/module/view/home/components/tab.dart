import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/app_controller.dart';
import 'package:vaxim/module/controller/data_controller.dart';
import 'package:vaxim/widgets/header_text.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appCtrl = Get.find();
    DataController data = Get.find();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      color: const Color(0xffFFFFFF),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HeaderText(text: "Browse By Category"),
          getVerticalSpace(15),
          SizedBox(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              child: Obx(() {
                return Row(
                  children: [
                    ...List.generate(
                      data.categoryList.length,
                      (index) => GestureDetector(
                        onTap: () {
                          appCtrl.changeHomeTabPage(index);
                        },
                        child: Container(
                          height: getScreenHeight(35),
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: index == appCtrl.homeTabIndex.value
                                  ? kDark
                                  : const Color(0xffF7F7F7),
                              borderRadius: BorderRadius.circular(7)),
                          child: FittedBox(
                            child: Text(
                              data.categoryList[index],
                              style: TextStyle(
                                color: index == appCtrl.homeTabIndex.value
                                    ? Colors.white
                                    : kGreyIcon,
                                fontWeight: index == appCtrl.homeTabIndex.value
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
