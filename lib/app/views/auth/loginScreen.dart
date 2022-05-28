import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todoly/app/data/theme/theme.dart';
import 'package:todoly/app/widgets/appIcon.dart';
import 'package:todoly/app/widgets/customCircularProgressLoadingIndicator.dart';
import 'package:todoly/app/widgets/customTextField.dart';
import 'package:todoly/app/controllers/authenticationModuleController.dart';
import 'package:todoly/app/widgets/socialMediaButton.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final AuthenticationModuleController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height * .1,
                      ),
                      AppIcon(
                        size: Get.width / 4.5,
                      ),
                      Text(
                        "Login",
                        style: getBoldTextStyle.copyWith(
                          fontSize: 25,
                          color: Get.theme.primaryColor,
                        ),
                      ),
                      Text(
                        "Please login to continue using the app.",
                        style: getDefaultTextStyle.copyWith(
                            color: Get.isDarkMode? greyColor: blackColor.withOpacity(.6), fontSize: 14),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      getLoginForm(),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        return GestureDetector(
                          onTap: controller.onLoginButtonClick,
                          child: Container(
                            height: 55,
                            width: Get.width / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                7,
                              ),
                              color: Get.theme.colorScheme.primary,
                            ),
                            alignment: Alignment.center,
                            child: controller
                                    .showLoginButtonLoadingAnimation.value
                                ? const CustomCircularProgressLoadingIndicator()
                                : Text(
                                    'Login',
                                    style: getBoldTextStyle,
                                  ),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      getSocialMediaTab(),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: controller.onSignupOnLoginPageButtonClick,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account? ",
                        style: getDefaultTextStyle.copyWith(
                          color: Get.isDarkMode? greyColor: blackColor.withOpacity(.6),
                        ),
                      ),
                      TextSpan(
                        text: "Get Started!",
                        style: getDefaultTextStyle.copyWith(
                          color: Get.theme.colorScheme.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column getSocialMediaTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Or login with',
          style: getDefaultTextStyle.copyWith(
            color: Get.isDarkMode? greyColor: blackColor.withOpacity(.6),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSocialMediaButtons(
              icon: FontAwesomeIcons.facebook,
              onTap: () {},
              color: darkBlueColor,
            ),
            const SizedBox(
              width: 10,
            ),
            CustomSocialMediaButtons(
              icon: FontAwesomeIcons.google,
              onTap: () {},
              color: Colors.red,
            ),
            const SizedBox(
              width: 10,
            ),
            CustomSocialMediaButtons(
              icon: FontAwesomeIcons.apple,
              onTap: () {},
              color: Colors.black,
            )
          ],
        )
      ],
    );
  }

  Widget getLoginForm() {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EMAIL ADDRESS',
            style: getDefaultTextStyle.copyWith(
              color: Get.theme.colorScheme.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextField(
            TEC: controller.loginEmailTEC,
            hint: "Enter your email address...",
            textInputType: TextInputType.emailAddress,
            maxLines: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'PASSWORD',
            style: getDefaultTextStyle.copyWith(
              color: Get.theme.colorScheme.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextField(
            TEC: controller.loginPasswordTEC,
            hint: "Enter your password...",
            textInputType: TextInputType.emailAddress,
            maxLines: 1,
            isPassword: true,
          )
        ],
      ),
    );
  }
}
