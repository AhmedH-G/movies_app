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

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

// class _SignUpViewState extends State<SignUpView> {
//   final PageController _controller = PageController(
//     viewportFraction: 0.4,
//   );
//   int selectedIndex = 0;
//
//   List<String> avatars = <String>[
//     "assets/images/avatar1.png",
//     "assets/images/avatar2.png",
//     "assets/images/avatar3.png",
//     "assets/images/avatar4.png",
//     "assets/images/avatar5.png",
//     "assets/images/avatar6.png",
//     "assets/images/avatar7.png",
//     "assets/images/avatar8.png",
//     "assets/images/avatar9.png",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Register")
//       ),
//         body: SingleChildScrollView(child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             // mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 161,
//                 child: PageView.builder(
//                   controller: _controller,
//                   itemCount: avatars.length,
//                   onPageChanged: (index) {
//                     setState(() {
//                       selectedIndex = index;
//                     });
//                   },
//                   itemBuilder: (context, index) {
//                     bool isSelected = index == selectedIndex;
//
//                     return AnimatedContainer(
//                       duration: Duration(milliseconds: 300),
//                       margin: EdgeInsets.symmetric(horizontal: 10),
//                       child: Transform.scale(
//                         scale: isSelected ? 1.2 : 0.8,
//                         child: GestureDetector(
//                           onTap: () {
//                             _controller.animateToPage(
//                               index,
//                               duration: Duration(milliseconds: 300),
//                               curve: Curves.easeInOut,
//                             );
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                             ),
//                             child: CircleAvatar(
//                               radius: 50,
//                               backgroundImage: AssetImage(avatars[index]),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 16,),
//               Center(child: Text("Avatar",style: TextStyle(color: ColorPallete.generalTextColor,fontSize: 16),)),
//               SizedBox(height: 16,),
//               CustomTextFromField(
//                 hintText: "Enter Your Name",
//                 prefixIcon: Assets.icons.user.image(),
//               ),
//               SizedBox(height: 16),
//               CustomTextFromField(
//                 hintText: "Enter Your Email",
//                 prefixIcon: Assets.icons.sms.image(),
//               ),
//               SizedBox(height: 16),
//               CustomTextFromField(
//                 isPassword: true,
//                 hintText: "Enter your password",
//                 prefixIcon: Assets.icons.lock.image(),
//               ),
//               SizedBox(height: 16),
//               CustomTextFromField(
//                 isPassword: true,
//                 hintText: "Confirm Enter your password",
//                 prefixIcon: Assets.icons.lock.image(),
//               ),
//               SizedBox(height: 16),
//               CustomTextFromField(
//                 hintText: "Phone Number",
//                 prefixIcon: Assets.icons.phone.image(),
//               ),
//               SizedBox(height: 16),
//               SizedBox(height: 16),
//               CustomElevatedButton(bottonText: "Create Account", onPressed: () {}),
//               SizedBox(height: 16),
//               RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "Already have an account? ",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: ColorPallete.generalTextColor,
//                       ),
//                     ),
//                     WidgetSpan(
//                       child: Bounceable(
//                         onTap: () {
//                           Navigator.pushNamed(context, PageRouteName.singIn);
//                         },
//                         child: Text(
//                           "Login",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                             color: ColorPallete.primaryColor,
//                             // decoration: TextDecoration.underline,
//                             // decorationColor: ColorPallete.primaryColor,
//                             // decorationThickness: 2,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16),
//               CustomSwapFlag(),
//             ],
//           ),
//         ),)
//     );
//   }
// }










class _SignUpViewState extends State<SignUpView> {
  final PageController _controller = PageController(viewportFraction: 0.4);
  int selectedIndex = 0;

  List<String> avatars = <String>[
    "assets/images/avatar1.png"
    "assets/images/avatar2.png",
    "assets/images/avatar3.png",
    "assets/images/avatar4.png",
    "assets/images/avatar5.png",
    "assets/images/avatar6.png",
    "assets/images/avatar7.png",
    "assets/images/avatar8.png",
    "assets/images/avatar9.png",
  ];

  // ----------------- Controllers -----------------
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // ----------------- SignUp Function -----------------
  void _handleSignUp() async {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();
    String phone = _phoneController.text.trim();
    String selectedAvatar = avatars[selectedIndex];

    // ---------------- Validation ----------------
    if (name.isEmpty) {
      toastification.show(
        title: Text('Name cannot be empty'),
        type: ToastificationType.error,
        autoCloseDuration: Duration(seconds: 5),
      );
      return;
    }

    if (email.isEmpty || !RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      toastification.show(
        title: Text('Enter a valid email'),
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

    if (password != confirmPassword) {
      toastification.show(
        title: Text('Passwords do not match'),
        type: ToastificationType.error,
        autoCloseDuration: Duration(seconds: 5),
      );
      return;
    }

    if (phone.isEmpty) {
      toastification.show(
        title: Text('Phone number cannot be empty'),
        type: ToastificationType.error,
        autoCloseDuration: Duration(seconds: 5),
      );
      return;
    }

    // ---------------- Show Loading ----------------
    configloading(); // هنا تشغّل الإعدادات
    EasyLoading.show(status: 'Creating account...');


    // ---------------- Call SignUp ----------------
    bool result = await FirebaseAuthUtils.signUp(
      emailAddress: email,
      password: password,
      displayName: name,
      phoneNumber: phone,
      avatarUrl: selectedAvatar,
    );

    // ---------------- Dismiss Loading ----------------
    EasyLoading.dismiss();

    if (result) {
      // toastification.show(
      //   title: Text('Account created successfully!'),
      //   type: ToastificationType.success,
      //   autoCloseDuration: Duration(seconds: 5),
      Navigator.pushReplacementNamed(
        context,
        PageRouteName.singIn,
      );


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Register")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 161,
              child: PageView.builder(
                controller: _controller,
                itemCount: avatars.length,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  bool isSelected = index == selectedIndex;
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Transform.scale(
                      scale: isSelected ? 1.2 : 0.8,
                      child: GestureDetector(
                        onTap: () {
                          _controller.animateToPage(
                            index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(avatars[index]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Center(child: Text("Avatar", style: TextStyle(color: ColorPallete.generalTextColor, fontSize: 16))),
            SizedBox(height: 16),
            CustomTextFromField(
              controller: _nameController,
              hintText: "Enter Your Name",
              prefixIcon: Assets.icons.user.image(),
            ),
            SizedBox(height: 16),
            CustomTextFromField(
              controller: _emailController,
              hintText: "Enter Your Email",
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
            CustomTextFromField(
              controller: _confirmPasswordController,
              isPassword: true,
              hintText: "Confirm Enter your password",
              prefixIcon: Assets.icons.lock.image(),
            ),
            SizedBox(height: 16),
            CustomTextFromField(
              controller: _phoneController,
              hintText: "Phone Number",
              prefixIcon: Assets.icons.phone.image(),
            ),
            SizedBox(height: 16),
            CustomElevatedButton(
              bottonText: "Create Account",
              onPressed: _handleSignUp,
              // onNavigation: () {
              //   Navigator.pushNamed(context, PageRouteName.singIn);
              // },
            ),
            SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ColorPallete.generalTextColor),
                  ),
                  WidgetSpan(
                    child: Bounceable(
                      onTap: () {
                        Navigator.pushNamed(context, PageRouteName.singIn);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ColorPallete.primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            CustomSwapFlag(),
          ],
        ),
      ),
    );
  }
}
