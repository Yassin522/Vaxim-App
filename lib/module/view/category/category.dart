import 'package:flutter/material.dart';
import 'package:vaxim/module/view/category/components/category_tab.dart';
import 'package:vaxim/module/view/category/components/category_tab_list.dart';
import 'package:vaxim/module/view/category/components/hot_product.dart';
import 'components/on_sell.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 15),
      children: const [
        CategoryTab(),
        CategoryTabList(),
        OnSell(),
        HotProduct(),
      ],
    );
  }
}
