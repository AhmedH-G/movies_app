import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../core/routes/page_route_name.dart';
import '../../../core/theme/color_pallete.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/custom_swap_flag.dart';
import '../../../core/widgets/custom_text_from_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  PageController _controller = PageController(
    viewportFraction: 0.4,
  );
  int selectedIndex = 0;

  List<String> avatars = <String>[
    "assets/images/avatar1.png",
    "assets/images/avatar2.png",
    "assets/images/avatar3.png",
    "assets/images/avatar4.png",
    "assets/images/avatar5.png",
    "assets/images/avatar6.png",
    "assets/images/avatar7.png",
    "assets/images/avatar8.png",
    "assets/images/avatar9.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Register")
      ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.start,
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
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(avatars[index]),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16,),
              Center(child: Text("Avatar",style: TextStyle(color: ColorPallete.generalTextColor,fontSize: 16),)),
              SizedBox(height: 16,),
              CustomTextFromField(
                hintText: "Enter Your Name",
                prefixIcon: Assets.icons.user.image(),
              ),
              SizedBox(height: 16),
              CustomTextFromField(
                hintText: "Enter Your Email",
                prefixIcon: Assets.icons.sms.image(),
              ),
              SizedBox(height: 16),
              CustomTextFromField(
                isPassword: true,
                hintText: "Enter your password",
                prefixIcon: Assets.icons.lock.image(),
              ),
              SizedBox(height: 16),
              CustomTextFromField(
                isPassword: true,
                hintText: "Confirm Enter your password",
                prefixIcon: Assets.icons.lock.image(),
              ),
              SizedBox(height: 16),
              CustomTextFromField(
                hintText: "Phone Number",
                prefixIcon: Assets.icons.phone.image(),
              ),
              SizedBox(height: 16),
              SizedBox(height: 16),
              CustomElevatedButton(bottonText: "Create Account", onPressed: () {}),
              SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ColorPallete.generalTextColor,
                      ),
                    ),
                    WidgetSpan(
                      child: Bounceable(
                        onTap: () {
                          Navigator.pushNamed(context, PageRouteName.singIn);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ColorPallete.primaryColor,
                            // decoration: TextDecoration.underline,
                            // decorationColor: ColorPallete.primaryColor,
                            // decorationThickness: 2,
                          ),
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
