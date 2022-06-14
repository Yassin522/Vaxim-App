import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaxim/config/routes.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/app_controller.dart';
import 'package:vaxim/module/controller/data_controller.dart';
import 'package:vaxim/module/model/cat_model.dart';

class CustomSearch extends SearchDelegate {
  DataController data = Get.find();
  AppController appCtrl = Get.find();
  var list = <CatModel>[];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (list.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = "";
            // data.searchData.value.products!.clear();
          },
        )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // if (data.searchData.value.products == null) {
    //   return const Center(
    //     child: Text("Please write something..."),
    //   );
    // // } else {
    // return Obx(
    //   () => data.searchLoading.value
    //       ? const Center(
    //           child: CircularProgressIndicator(),
    //         )
    //       : data.searchData.value.products!.isEmpty
    //           ? const Center(
    //               child: Text("No Results Found"),
    //             )
    //           : Column(
    //               children: [
    //                 Expanded(
    //                   child: GridView.builder(
    //                     itemCount: data.searchData.value.products!.length,
    //                     padding: const EdgeInsets.symmetric(
    //                         horizontal: 15, vertical: 15),
    //                     gridDelegate:
    //                         const SliverGridDelegateWithFixedCrossAxisCount(
    //                       crossAxisCount: 2,
    //                       childAspectRatio: 0.66,
    //                       crossAxisSpacing: 10,
    //                       mainAxisSpacing: 10,
    //                     ),
    //                     itemBuilder: (ctx, index) {
    //                       final item = data.searchData.value.products![index];
    //                       return const Text("Search");
    //                       // ProductItem(
    //                       //   item: item,
    //                       //   press: () {
    //                       //     Get.toNamed(AppRoute.detailsPage,
    //                       //         arguments: item.id);
    //                       //   },
    //                       // );
    //                     },
    //                   ),
    //                 ),
    //               ],
    //             ),
    // );
    // }
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // AppController appCtrl = Get.find();
    list = query.isEmpty
        ? []
        : data.category
            .where((p) => p.name!.isCaseInsensitiveContains(query))
            .toList();
    return Column(
      children: [
        if (query.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              "${list.length} Result(s) found",
              style: GoogleFonts.jost(
                fontSize: getTextSize(14),
                fontWeight: FontWeight.w600,
                color: kGreen,
              ),
            ),
          ),
        Expanded(
          child: ListView.separated(
            itemCount: list.length,
            separatorBuilder: (context, index) => const Divider(height: 0),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemBuilder: (ctx, index) {
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                horizontalTitleGap: 10,
                title: Text(
                  list[index].name!,
                  style: GoogleFonts.jost(
                    fontSize: getTextSize(12),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: const Icon(Icons.search, size: 15),
                onTap: () async {
                  appCtrl.searchCategoryItems(list[index].name);

                  Get.offAndToNamed(AppRoute.searchPage);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
