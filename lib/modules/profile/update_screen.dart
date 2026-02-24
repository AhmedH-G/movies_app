import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/routes/page_route_name.dart';
import '../../../../core/gen/assets.gen.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Pick Avatar"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            _buildAvatar(),
            const SizedBox(height: 30),
            _buildNameField(),
            const SizedBox(height: 15),
            _buildPhoneField(),
            const SizedBox(height: 15),
            _buildResetPassword(),
            const Spacer(),
            _buildDeleteButton(),
            const SizedBox(height: 15),
            _buildUpdateButton(context),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  // PreferredSizeWidget _buildAppBar(BuildContext context) {
  //   return AppBar(
  //     backgroundColor: Colors.black,
  //     elevation: 0,
  //     leading: IconButton(
  //       icon: const Icon(Icons.arrow_back, color: Colors.amber),
  //       onPressed: () {
  //         Navigator.pop(context);
  //       },
  //     ),
  //     centerTitle: true,
  //     title: const Text(
  //       "Pick Avatar",
  //       style: TextStyle(
  //         color: Colors.amber,
  //         fontSize: 18,
  //         fontWeight: FontWeight.w600,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 60,
      backgroundImage: Assets.images.gamer1.provider(),
    );
  }

  Widget _buildNameField() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xff2B2B2B),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Assets.icons.User4.image(
            width: 22,
            height: 22,
          ),
          const SizedBox(width: 10),
          const Text(
            "John Safwat",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneField() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xff2B2B2B),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Assets.icons.phone.image(
            width: 22,
            height: 22,
          ),
          const SizedBox(width: 10),
          const Text(
            "012000000000",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResetPassword() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Reset Password",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: CustomElevatedButton(
        bottonText: "Delete Account",
        backgroundColor: Colors.red,
        bordarColor: Colors.red,
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
  }

  Widget _buildUpdateButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: CustomElevatedButton(
        bottonText: "Update Data",
        textColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(
            context,
            PageRouteName.pickAvatar,
          );
        },
      ),
    );
  }
}