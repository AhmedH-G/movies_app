import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import 'package:toastification/toastification.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../core/services/loading_service.dart';
import '../../../core/utils/firebase_auth_utils.dart';
import '../../../core/widgets/custom_text_from_field.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController _emailController = TextEditingController();

  void _handleResetPassword() async {
    String email = _emailController.text.trim();

    // ---------------- Validation ----------------
    if (email.isEmpty || !RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      toastification.show(
        title: const Text('Enter valid email'),
        type: ToastificationType.error,
        autoCloseDuration: const Duration(seconds: 5),
      );
      return;
    }

    // ---------------- Show Loading ----------------
    configloading();
    EasyLoading.show(status: "Sending reset link...");

    // ---------------- Call Firebase ----------------
    bool result = await FirebaseAuthUtils.resetPassword(email);

    // ---------------- Hide Loading ----------------
    EasyLoading.dismiss();

    if (result) {
      toastification.show(
        title: const Text('Password reset link sent to your email'),
        type: ToastificationType.success,
        autoCloseDuration: const Duration(seconds: 5),
      );

      Navigator.pop(context);
    } else {
      toastification.show(
        title: const Text('Failed to send reset link'),
        type: ToastificationType.error,
        autoCloseDuration: const Duration(seconds: 5),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Forget Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Assets.images.forgetPassword.image(),
            const SizedBox(height: 16),
            CustomTextFromField(
              controller: _emailController,
              hintText: "Email",
              prefixIcon: Assets.icons.sms.image(),
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              bottonText: "Verify Email",
              onPressed: _handleResetPassword,
            ),
          ],
        ),
      ),
    );
  }
}