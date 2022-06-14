import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/assets_path.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find();
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Column(
          children: [
            getVerticalSpace(40),
            Image.asset(userProfile),
            getVerticalSpace(20),
            Text(
              auth.authModel.value.user!.username!,
              style: GoogleFonts.jost(
                fontSize: getTextSize(24),
                fontWeight: FontWeight.w700,
                color: kDark,
              ),
            ),
            getVerticalSpace(5),
            Text(
              auth.authModel.value.user!.email!,
              style: GoogleFonts.jost(
                fontSize: getTextSize(14),
                fontWeight: FontWeight.w400,
                color: kLightText,
              ),
            ),
            getVerticalSpace(30),
            const Divider(),
            getVerticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Phone",
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(14),
                    fontWeight: FontWeight.w500,
                    color: kLightText,
                  ),
                ),
                Text(
                  "+00 990 249 3425",
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(14),
                    fontWeight: FontWeight.w500,
                    color: kDark,
                  ),
                ),
              ],
            ),
            getVerticalSpace(15),
            const Divider(),
            getVerticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Joined",
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(14),
                    fontWeight: FontWeight.w500,
                    color: kLightText,
                  ),
                ),
                Text(
                  DateFormat.yMMMMd().format(
                      DateTime.parse(auth.authModel.value.user!.createdAt!)),
                  style: GoogleFonts.jost(
                    fontSize: getTextSize(14),
                    fontWeight: FontWeight.w500,
                    color: kDark,
                  ),
                ),
              ],
            ),
            getVerticalSpace(15),
            const Divider(),
            getVerticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Role",
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(14),
                    fontWeight: FontWeight.w500,
                    color: kLightText,
                  ),
                ),
                Text(
                  auth.authModel.value.user!.role!.name!,
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(14),
                    fontWeight: FontWeight.w500,
                    color: kDark,
                  ),
                ),
              ],
            ),
            getVerticalSpace(15),
            const Divider(),
            getVerticalSpace(15),
          ],
        ),
      ],
    );
  }
}
