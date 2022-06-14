import 'package:flutter/material.dart';
import 'package:vaxim/widgets/app_bar.dart';

import 'components/product_tab.dart';
import 'components/product_list.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHelper.instance.buildAppBar(title: "All Products"),
      body: ListView(
      children: const [
        ProductTab(),
        AllProduct(),
      ],
    )
    );
  }
}
