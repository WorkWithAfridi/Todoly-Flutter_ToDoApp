import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todoly/app/data/globalConstants.dart';
import 'package:todoly/app/globalWidgets/appIcon.dart';
import 'package:todoly/app/globalWidgets/textField.dart';
import 'package:todoly/app/modules/authentication/controller/AuthenticationModuleController.dart';
import 'package:todoly/app/modules/authentication/widgets/socialMediaButton.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final AuthenticationModuleController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    print(Get.width);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
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
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Login",
                        style: boldTS25.copyWith(fontSize: 20),
                      ),
                      Text(
                        "Please login to continue using the app.",
                        style: defaultTS.copyWith(
                          color: greyColor,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      getLoginForm(),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 55,
                        width: Get.width / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            customBorderRadius,
                          ),
                          color: secondaryColor,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Login',
                          style: defaultTS.copyWith(
                              color: whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
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
                onTap: controller.onSignupButtonClick,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account? ",
                        style: defaultTS.copyWith(
                          color: greyColor,
                        ),
                      ),
                      TextSpan(
                        text: "Get Started!",
                        style: defaultTS.copyWith(
                          color: primaryColor,
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
          style: defaultTS.copyWith(
            color: greyColor,
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

  Container getLoginForm() {
    return Container(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EMAIL ADDRESS',
            style: defaultTS.copyWith(
              color: darkBlueColor,
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
            style: defaultTS.copyWith(
              color: darkBlueColor,
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
