import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todoly/app/data/globalConstants.dart';
import 'package:todoly/app/globalWidgets/appIcon.dart';
import 'package:todoly/app/globalWidgets/customBackButton.dart';
import 'package:todoly/app/globalWidgets/customCircularProgressLoadingIndicator.dart';
import 'package:todoly/app/globalWidgets/textField.dart';
import 'package:todoly/app/modules/authentication/controller/AuthenticationModuleController.dart';
import 'package:todoly/app/modules/authentication/widgets/socialMediaButton.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final AuthenticationModuleController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New user?",
          style: boldTS25.copyWith(
            fontSize: 16,
          ),
        ),
        leading: CustomBackButton(),
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: whiteColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create an account.",
                style: boldTS25.copyWith(fontSize: 20),
              ),
              Text(
                "Hi, please create the app to continue using the app!",
                style: defaultTS.copyWith(
                  color: greyColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              getSignupForm(),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return GestureDetector(
                  onTap: controller.onSignupButtonClick,
                  child: Container(
                    height: 55,
                    width: Get.width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        customBorderRadius,
                      ),
                      color: orangeColor,
                    ),
                    alignment: Alignment.center,
                    child: controller.showSignupButtonLoadingAnimation.value
                        ? CustomCircularProgressLoadingIndicator()
                        : Text(
                            'Signup',
                            style: defaultTS.copyWith(
                                color: whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                  ),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              getSignupWIthSocialMediaTab(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column getSignupForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'USERNAME',
          style: defaultTS.copyWith(
            color: darkBlueColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextField(
          TEC: controller.signupUserNameTEC,
          hint: "Enter your username...",
          textInputType: TextInputType.text,
          maxLines: 1,
        ),
        const SizedBox(
          height: 10,
        ),
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
          TEC: controller.signupEmailTEC,
          hint: "Enter your email address...",
          textInputType: TextInputType.text,
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
          TEC: controller.signupPasswordTEC,
          hint: "Enter your password...",
          textInputType: TextInputType.text,
          maxLines: 1,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'PHONE',
          style: defaultTS.copyWith(
            color: darkBlueColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextField(
          TEC: controller.signupUserPhoneTEC,
          hint: "Enter your phone number...",
          textInputType: TextInputType.text,
          maxLines: 1,
        ),
      ],
    );
  }

  Column getSignupWIthSocialMediaTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Or signup using',
          style: defaultTS.copyWith(
            color: greyColor,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
}
