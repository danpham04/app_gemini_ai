import 'package:animate_do/animate_do.dart';
import 'package:app_gemin_ai/global/config/app_icon.dart';
import 'package:app_gemin_ai/global/config/app_paths.dart';
import 'package:app_gemin_ai/global/router/app_router.dart';
import 'package:app_gemin_ai/pages/auth/widgets/custom_fade_text.dart';
import 'package:app_gemin_ai/pages/auth/widgets/custom_fedein_img.dart';
import 'package:app_gemin_ai/provider/provider_auth.dart';
import 'package:app_gemin_ai/widgets/text_field_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final ProviderAuth controller = context.watch<ProviderAuth>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 400,
              child: Stack(
                children: <Widget>[
                  CustomFedeinImg(
                    pathImg: AppPaths.background,
                    top: -40,
                    height: 400,
                    width: width,
                    duration: const Duration(seconds: 1),
                    fit: BoxFit.fill,
                  ),
                  CustomFedeinImg(
                    pathImg: AppPaths.background2,
                    height: 400,
                    width: width + 20,
                    duration: const Duration(milliseconds: 1000),
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CustomFadeText(
                    text: "Login",
                    fontWeight: FontWeight.bold,
                    size: 30,
                    color: Color.fromRGBO(49, 39, 79, 1),
                    duration: Duration(milliseconds: 1500),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1700),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: const Color.fromRGBO(196, 135, 198, .3)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(196, 135, 198, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          )
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromRGBO(196, 135, 198, .3),
                                ),
                              ),
                            ),
                            child: TextFieldApp(
                                controller: controller.emailLoginController,
                                hintText: "Vui lòng nhập tên tài khoản",
                                icon: Image.asset(
                                  AppIcons.user,
                                  width: 25,
                                ),
                                border: InputBorder.none,
                                color: Colors.grey.shade700),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFieldApp(
                              controller: controller.passwordLoginController,
                              hintText: "Vui lòng nhập mật khẩu của bạn",
                              border: InputBorder.none,
                              keyboardType: TextInputType.number,
                              obscureText: controller.checkPassLogin,
                              icon: controller.checkPassLogin
                                  ? Image.asset(
                                      AppIcons.lock,
                                      width: 25,
                                    )
                                  : Image.asset(
                                      AppIcons.lockOpen,
                                      width: 25,
                                    ),
                              onPressed: () => controller.displayPass(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: CustomFadeText(
                      text: "Forgot Password?",
                      onPressed: () {},
                      color: const Color.fromRGBO(196, 135, 198, 1),
                      duration: const Duration(milliseconds: 1700),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1900),
                    child: MaterialButton(
                      onPressed: () async {
                        await controller.login();
                        if (controller.isLoggedIn) {
                          Navigator.pushNamed(context, AppRoutes.onBoading);
                        }
                      },
                      color: const Color.fromRGBO(49, 39, 79, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 50,
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: CustomFadeText(
                      text: "Create Account",
                      duration: const Duration(milliseconds: 2000),
                      color: const Color.fromRGBO(49, 39, 79, .6),
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.signup);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
