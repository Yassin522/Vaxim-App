import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaxim/constants/app_color.dart';
import 'package:vaxim/constants/app_constants.dart';
import 'package:vaxim/constants/assets_path.dart';
import 'package:vaxim/constants/size.dart';
import 'package:vaxim/module/controller/app_controller.dart';
import 'package:vaxim/module/controller/auth_controller.dart';
import 'package:vaxim/utils/helper/dialog.dart';
import 'package:vaxim/widgets/account_text.dart';
import 'package:vaxim/widgets/custom_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AppController appCtrl = Get.find();
  AuthController authCtrl = Get.find();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();

  bool isSignIn = true;
  @override
  void dispose() {
    super.dispose();
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      extendBodyBehindAppBar: true,
      body: Container(
        height: ResponsiveSize.screenHeight,
        width: ResponsiveSize.screenWidth,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 50),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(loginBgImage), fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isSignIn ? "Log In" : "Register",
                style: GoogleFonts.jost(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                  fontSize: getTextSize(36),
                ),
              ),
              Text(
                isSignIn
                    ? "Welcome back to Vaxim"
                    : "You are always welcome to Vaxim",
                style: GoogleFonts.jost(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.3,
                  fontSize: getTextSize(18),
                ),
              ),
              getVerticalSpace(20),
              Visibility(
                visible: !isSignIn,
                child: TextField(
                  controller: _nameCtrl,
                  style: const TextStyle(color: Colors.white),
                  decoration: buildCredentialDecoration(hintText: "Username"),
                ),
              ),
              getVerticalSpace(10),
              TextField(
                controller: _emailCtrl,
                style: const TextStyle(color: Colors.white),
                decoration: buildCredentialDecoration(hintText: "Email"),
              ),
              getVerticalSpace(15),
              TextField(
                controller: _passCtrl,
                style: const TextStyle(color: Colors.white),
                decoration: buildCredentialDecoration(hintText: "Password"),
              ),
              getVerticalSpace(10),
              Obx(
                () {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                            value: appCtrl.isRemember.value,
                            checkColor: kDark,
                            activeColor: Colors.white,
                            onChanged: (v) {
                              appCtrl.isRemember(v);
                            }),
                        getHorizontalSpace(2),
                        Text(
                          isSignIn
                              ? "Remember Me"
                              : "I accept all Terms & Condition",
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w400,
                            fontSize: getTextSize(14),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              getVerticalSpace(20),
              CustomButton(
                text: isSignIn ? 'Log In' : "Register",
                press: () {
                  if (isSignIn) {
                    debugPrint("Sign IN");
                    tapToSignIn();
                  } else {
                    debugPrint("Register");
                    tapToRegister();
                  }
                },
              ),
              getVerticalSpace(15),
              if (isSignIn)
                AccountText(
                  text: "Don’t Have An Account?",
                  authText: "Sign Up",
                  press: () {
                    isSignIn = false;
                    changeState();
                  },
                ),
              if (!isSignIn)
                AccountText(
                  text: "Have An Account?",
                  authText: "Sign In",
                  press: () {
                    isSignIn = true;
                    changeState();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  changeState() {
    if (mounted) setState(() {});
  }

  void tapToSignIn() async {
    final email = _emailCtrl.text;
    final pass = _passCtrl.text;

    if (email.isNotEmpty && pass.isNotEmpty) {
      try {
        EasyLoading.show(status: "Please wait");
        final result = await authCtrl.userLogin(email: email, pass: pass);

        if (result) {
          EasyLoading.showSuccess("Login Successful");
          Get.back();
        } else {
          DialogHelper.instance.showMessage(
            errorMessage: "Login Failed",
            message: authCtrl
                .authErrorModel.value.message!.first.messages!.first.message,
          );
        }
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
        EasyLoading.dismiss();
      } finally {
        EasyLoading.dismiss();
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Field can't be empty")));
    }
  }

  void tapToRegister() async {
    final email = _emailCtrl.text;
    final pass = _passCtrl.text;
    final name = _nameCtrl.text;
    if (email.isNotEmpty && pass.isNotEmpty && name.isNotEmpty) {
      try {
        EasyLoading.show(status: "Please wait");
        final result = await authCtrl.userRegister(
            username: name, email: email, pass: pass);
        if (result) {
          EasyLoading.showSuccess("Register Successful");
          Get.back();
        } else {
          DialogHelper.instance.showMessage(
            errorMessage: "Registration Failed",
            message: authCtrl
                .authErrorModel.value.message!.first.messages!.first.message,
          );
        }
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
        EasyLoading.showError("Something Wrong");
      } finally {
        EasyLoading.dismiss();
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Field can't be empty")));
    }
  }
}
