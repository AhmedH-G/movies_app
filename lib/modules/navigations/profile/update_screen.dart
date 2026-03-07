// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:movies/modules/navigations/profile/pick_avatar_screen.dart';
// import 'package:toastification/toastification.dart';
// import '../../../../core/widgets/custom_elevated_button.dart';
// import '../../../../core/routes/page_route_name.dart';
// import '../../../../core/gen/assets.gen.dart';
// import '../../../core/services/loading_service.dart';
// import '../../../core/utils/firebase_auth_utils.dart';
// import '../../../models/user_data_model.dart';
//
// class UpdateScreen extends StatefulWidget {
//   const UpdateScreen({super.key});
//
//   @override
//   State<StatefulWidget> createState() => _UpdateScreenState();
// }
// class _UpdateScreenState extends State<UpdateScreen>{
//   UserDataModel? userModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//                 title: Text("Pick Avatar"),
//               ),
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: [
//             const SizedBox(height: 30),
//             _buildAvatar(),
//             const SizedBox(height: 30),
//             _buildInfoField(Assets.icons.User4.path, userModel?.name ?? " "),
//             const SizedBox(height: 15),
//             _buildInfoField(Assets.icons.phone.path, userModel?.phone ?? " "),
//             const SizedBox(height: 15),
//             _buildResetPassword(),
//             const Spacer(),
//             _buildDeleteButton(),
//             const SizedBox(height: 15),
//             _buildUpdateButton(context),
//             const SizedBox(height: 25),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   Widget _buildAvatar() {
//     return CircleAvatar(
//       radius: 60,
//       backgroundImage: userModel != null? AssetImage(userModel!.avatarUrl): Assets.images.gamer1.provider(),
//     );
//   }
//
//   Widget _buildInfoField(String icon, String text){
//     return Container(
//         height: 60,
//         decoration: BoxDecoration(
//           color: const Color(0xff2B2B2B),
//           borderRadius: BorderRadius.circular(18),
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: Row(
//           children: [
//             Image.asset(icon, width: 22, height: 22, color: Colors.white),
//             const SizedBox(width: 10),
//             Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
//           ],
//         ),
//     );
//   }
//
//   Widget _buildResetPassword() {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         "Reset Password",
//         style: Theme.of(context).textTheme.titleSmall
//       ),
//     );
//   }
//
//   Widget _buildDeleteButton() {
//     return SizedBox(
//       width: double.infinity,
//       height: 55,
//       child: CustomElevatedButton(
//         bottonText: "Delete Account",
//         backgroundColor: Colors.red,
//         bordarColor: Colors.red,
//         textColor: Colors.white,
//         onPressed: () {},
//       ),
//     );
//   }
//
//   Widget _buildUpdateButton(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 55,
//       child: CustomElevatedButton(
//         bottonText: "Update Data",
//         textColor: Colors.black,
//         onPressed: () {
//           Navigator.pushNamed(
//             context,
//             PageRouteName.pickAvatar,
//           );
//         },
//       ),
//     );
//   }
//
//
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movies/core/theme/color_pallete.dart';
import 'package:movies/modules/navigations/profile/pick_avatar_screen.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/routes/page_route_name.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../core/services/loading_service.dart';
import '../../../core/utils/firebase_auth_utils.dart';
import '../../../models/user_data_model.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<StatefulWidget> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  UserDataModel? userModel;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final List<String> avatars = [
    Assets.images.Component1.path,
    Assets.images.Component8.path,
    Assets.images.Component4.path,
    Assets.images.Component5.path,
    Assets.images.Component6.path,
    Assets.images.Component7.path,
    Assets.images.Component8.path,
    Assets.images.Component9.path,
    Assets.images.Component10.path,
  ];

  int selectedAvatarIndex = 0;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var data = await FirebaseAuthUtils.getUserFromFireStore(uid);
    if (data != null) {
      setState(() {
        userModel = data;
        nameController.text = data.name;
        phoneController.text = data.phone;
        selectedAvatarIndex = avatars.indexOf(data.avatarUrl);
        if (selectedAvatarIndex == -1) selectedAvatarIndex = 0;
      });
    }
  }

  void _handleUpdateData() async {
    if (nameController.text.isEmpty || phoneController.text.isEmpty) {
      toastification.show(
        title: const Text('Fields cannot be empty'),
        type: ToastificationType.error,
      );
      return;
    }

    configloading();
    EasyLoading.show(status: "Updating Profile...");

    try {
      UserDataModel updatedUser = UserDataModel(
        uId: FirebaseAuth.instance.currentUser!.uid,
        name: nameController.text.trim(),
        email: FirebaseAuth.instance.currentUser!.email!,
        phone: phoneController.text.trim(),
        avatarUrl: avatars[selectedAvatarIndex],
      );

      await FirebaseAuthUtils.updateUserData(updatedUser);
      EasyLoading.dismiss();

      toastification.show(
        title: const Text('Profile updated successfully!'),
        type: ToastificationType.success,
        autoCloseDuration: const Duration(seconds: 3),
      );
    } catch (e) {
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Pick Avatar")),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildAvatar(),
            const SizedBox(height: 20),
            _buildEditableField(Assets.icons.User4.path, nameController),
            const SizedBox(height: 15),
            _buildEditableField(Assets.icons.phone.path, phoneController),
            const SizedBox(height: 5),
            _buildResetPassword(),
            const SizedBox(height: 100),
            _buildDeleteButton(),
            const SizedBox(height: 15),
            _buildUpdateButton(),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return GestureDetector(
      onTap: () => _showAvatarPickerSheet(),
      child: ClipOval(
        child: Image.asset(
          avatars[selectedAvatarIndex],
          fit: BoxFit.cover,
          height: 180,
          width: 180,
        ),
      ),
    );
  }

  void _showAvatarPickerSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorPallete.bordarColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return PickAvatarScreen(
          avatars: avatars,
          selectedAvatarIndex: selectedAvatarIndex,
          onAvatarSelected: (index) {
            setState(() {
              selectedAvatarIndex = index;
            });
          },
        );
      },
    );
  }

  Widget _buildEditableField(String icon, TextEditingController controller) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: ColorPallete.bacgroundTextfelid,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 22,
            height: 22,
            color: ColorPallete.generalTextColor,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(
                color: ColorPallete.generalTextColor,
                fontSize: 16,
              ),
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResetPassword() {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () =>
            Navigator.pushNamed(context, PageRouteName.forgetPassword),
        child: Text(
          "Reset Password",
          style: Theme.of(context).textTheme.titleSmall,
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
        backgroundColor: ColorPallete.buttonRedColor,
        bordarColor: ColorPallete.buttonRedColor,
        textColor: ColorPallete.generalTextColor,
        onPressed: () async {
          bool result = await FirebaseAuthUtils.deleteAccount();
          if (result && mounted) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              PageRouteName.singIn,
              (route) => false,
            );
          }
        },
      ),
    );
  }

  Widget _buildUpdateButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: CustomElevatedButton(
        bottonText: "Update Data",
        textColor: Colors.black,
        onPressed: _handleUpdateData,
      ),
    );
  }
}
