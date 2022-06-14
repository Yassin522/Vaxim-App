import 'package:flutter/material.dart';
import 'components/details_panel.dart';
import 'components/info.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(bottom: 15),
        children: const [
          Info(),
          DetailsPanel(),
        ],
      ),
    ));
  }
}
