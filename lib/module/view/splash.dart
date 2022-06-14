import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaxim/config/routes.dart';
import 'package:vaxim/constants/assets_path.dart';
import 'package:vaxim/constants/size.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(3.seconds).then(
      (value) => Get.offAndToNamed(
        AppRoute.landPage,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return OrientationBuilder(
            builder: (ctx, orientation) {
              ResponsiveSize.init(ctx, orientation);
              return Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                padding: const EdgeInsets.only(bottom: 100),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(loginBgImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Vaxim",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.jost(
                              fontSize: getTextSize(50),
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                              color: Colors.white,
                            ),
                          ),
                          getVerticalSpace(8),
                          Text(
                            "Welcome to Vaxim. Lets Shop\nYour Dream Clothing",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: getTextSize(18),
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.3,
                              height: 1.5,
                              color: const Color(0xffCFCFCF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
