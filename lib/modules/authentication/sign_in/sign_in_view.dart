import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:toastification/toastification.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../core/routes/page_route_name.dart';
import '../../../core/services/loading_service.dart';
import '../../../core/theme/color_pallete.dart';
import '../../../core/utils/firebase_auth_utils.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/custom_swap_flag.dart';
import '../../../core/widgets/custom_text_from_field.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleSignIn() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || !RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      toastification.show(
        title: Text('Enter valid email'),
        type: ToastificationType.error,
        autoCloseDuration: Duration(seconds: 5),
      );
      return;
    }

    if (password.isEmpty) {
      toastification.show(
        title: Text('Password cannot be empty'),
        type: ToastificationType.error,
        autoCloseDuration: Duration(seconds: 5),
      );
      return;
    }

    // تشغيل اللودنج
    configloading();
    EasyLoading.show(status: "Logging in...");

    bool result = await FirebaseAuthUtils.singIn(
      emailAddress: email,
      password: password,
    );

    EasyLoading.dismiss();

    if (result) {
      Navigator.pushReplacementNamed(
        context,
        PageRouteName.HomeScreen,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 67),
            Assets.images.logo.image(width: 121, height: 118),
            SizedBox(height: 24),
            CustomTextFromField(
              controller: _emailController,
              hintText: "Email",
              prefixIcon: Assets.icons.sms.image(),
            ),
            SizedBox(height: 16),
            CustomTextFromField(
              controller: _passwordController,
              isPassword: true,
              hintText: "Enter your password",
              prefixIcon: Assets.icons.lock.image(),
            ),
            SizedBox(height: 16),
            Bounceable(
              onTap: () {
                Navigator.pushNamed(context, PageRouteName.forgetPassword);
              },
              child: Text(
                "Forget Password?",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorPallete.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            CustomElevatedButton(
              bottonText: "Login",
              onPressed:_handleSignIn,
            ),
            SizedBox(height: 24),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't Have Account ? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ColorPallete.generalTextColor,
                    ),
                  ),
                  WidgetSpan(
                    child: Bounceable(
                      onTap: () {
                        Navigator.pushNamed(context, PageRouteName.singUp);
                      },
                      child: Text(
                        "Create One",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorPallete.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    indent: 40,
                    endIndent: 40,
                    color: ColorPallete.primaryColor,
                  ),
                ),
                Text(
                  "OR",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorPallete.primaryColor,
                  ),
                ),
                Expanded(
                  child: Divider(
                    indent: 40,
                    endIndent: 40,
                    color: ColorPallete.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            CustomElevatedButton(
              backgroundColor: ColorPallete.primaryColor,
              customChild: Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.google.image(color: Colors.black),
                  Text(
                    "Login With Google",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: ColorPallete.bacgroundTextfelid,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            CustomSwapFlag(),
          ],
        ),
      ),
    );
  }
}
