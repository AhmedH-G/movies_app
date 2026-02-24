import 'package:flutter/material.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../core/widgets/custom_text_from_field.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Forget Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Assets.images.forgetPassword.image(),
            SizedBox(height: 16),
            CustomTextFromField(
              hintText: "Email",
              prefixIcon: Assets.icons.sms.image(),
            ),
            SizedBox(height: 16),
            CustomElevatedButton(bottonText: "Vrify Email", onPressed: () {},),
          ],
        ),
      ),
    );
  }
}
