import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/model/product_model.dart';
import 'package:vaxim/utils/helper/lazy_loader.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    this.item,
    this.press,
    this.widthSize = 160,
  }) : super(key: key);
  final ProductModel? item;
  final VoidCallback? press;
  final double? widthSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: getScreenHeight(200),
        width: getScreeWidth(widthSize!),
        color: const Color(0xffF8F8F8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: item!.detailsImg!.first.url!,
                  imageBuilder: (context, imageProvider) => Container(
                    height: getScreenHeight(148),
                    width: getScreeWidth(widthSize!),
                    decoration: BoxDecoration(
                      color: const Color(0xffF8F8F8),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const ShimmerLoader(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                if (item!.hot!)
                  Positioned(
                    right: 0,
                    top: 5,
                    child: Container(
                      height: getScreenHeight(20),
                      width: getScreeWidth(35),
                      color: kRed,
                      alignment: Alignment.center,
                      child: Text(
                        "Hot",
                        style: GoogleFonts.jost(
                          color: Colors.white,
                          fontSize: getTextSize(12),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                if (item!.newArrival!)
                  Positioned(
                    right: 0,
                    top: 5,
                    child: Container(
                      height: getScreenHeight(20),
                      width: getScreeWidth(35),
                      color: kGreen,
                      alignment: Alignment.center,
                      child: Text(
                        "New",
                        style: GoogleFonts.jost(
                          color: Colors.white,
                          fontSize: getTextSize(12),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const Divider(height: 0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item!.title!,
                    maxLines: 1,
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w700,
                      fontSize: getTextSize(14),
                    ),
                  ),
                  Text(
                    "\$ ${item!.currentPrice!}",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w500,
                      fontSize: getTextSize(12),
                      color: kGreyIcon,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
