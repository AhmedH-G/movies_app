// import 'package:flutter/material.dart';
//
// import '../../../core/gen/assets.gen.dart';
//
// class PickAvatarScreen extends StatefulWidget {
//   const PickAvatarScreen({super.key});
//
//   @override
//   State<PickAvatarScreen> createState() => _PickAvatarScreenState();
// }
//
// class _PickAvatarScreenState extends State<PickAvatarScreen> {
//   int selectedIndex = 1;
//   bool showAvatars = false;
//
//   final TextEditingController nameController = TextEditingController(
//     text: "John Safwattt",
//   );
//   final TextEditingController phoneController = TextEditingController(
//     text: "01200000000",
//   );
//
//   final List<String> avatars = [
//     Assets.images.Component1.path,
//     Assets.images.Component8.path,
//     Assets.images.Component4.path,
//     Assets.images.Component5.path,
//     Assets.images.Component6.path,
//     Assets.images.Component7.path,
//     Assets.images.Component8.path,
//     Assets.images.Component9.path,
//     Assets.images.Component10.path,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(title: Text("Pick Avatar")),
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 25),
//                 _buildAvatarPicker(),
//                 SizedBox(height: 30),
//                 _buildNameField(),
//                 SizedBox(height: 15),
//                 _buildPhoneField(),
//                 SizedBox(height: 20),
//                 _buildResetPassword(),
//                 SizedBox(height: 25),
//                 if (showAvatars) _buildAvatarsGrid(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAvatarPicker() {
//     return Center(
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             showAvatars = !showAvatars;
//           });
//         },
//         child: CircleAvatar(
//           radius: 60,
//           backgroundColor: Colors.yellow.withOpacity(0.3),
//           child: CircleAvatar(
//             radius: 55,
//             backgroundImage: AssetImage(avatars[selectedIndex]),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNameField() {
//     return _buildEditableField(
//       image: Assets.icons.User4.path,
//       controller: nameController,
//       keyboardType: TextInputType.name,
//     );
//   }
//
//   Widget _buildPhoneField() {
//     return _buildEditableField(
//       image: Assets.icons.phone.path,
//       controller: phoneController,
//       keyboardType: TextInputType.phone,
//     );
//   }
//
//   Widget _buildResetPassword() {
//     return const Text(
//       "Reset Password",
//       style: TextStyle(color: Colors.white60, fontSize: 14),
//     );
//   }
//
//   Widget _buildEditableField({
//     required String image,
//     required TextEditingController controller,
//     required TextInputType keyboardType,
//   }) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       height: 55,
//       decoration: BoxDecoration(
//         color: Colors.grey.shade900,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Image.asset(image, width: 20, height: 20, color: Colors.white54),
//           const SizedBox(width: 10),
//           Expanded(
//             child: TextField(
//               controller: controller,
//               keyboardType: keyboardType,
//               style: const TextStyle(color: Colors.white, fontSize: 15),
//               decoration: const InputDecoration(border: InputBorder.none),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAvatarsGrid() {
//     return SizedBox(
//         height: 300,
//         child: GridView.builder(
//         itemCount: avatars.length,gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           crossAxisSpacing: 15,
//           mainAxisSpacing: 15,
//         ),
//           itemBuilder: (context, index) {
//             final isSelected = selectedIndex == index;
//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedIndex = index;
//                 });
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   border: isSelected
//                       ? Border.all(color: Colors.yellow, width: 3)
//                       : null,
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.asset(avatars[index], fit: BoxFit.cover),
//                 ),
//               ),
//             );
//           },
//         ),
//     );
//   }
// }
//
//
import 'package:flutter/material.dart';
import '../../../core/theme/color_pallete.dart';

class PickAvatarScreen extends StatelessWidget {
  final List<String> avatars;
  final int selectedAvatarIndex;
  final Function(int) onAvatarSelected;
  const PickAvatarScreen({
    super.key,
    required this.avatars,
    required this.selectedAvatarIndex,
    required this.onAvatarSelected,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setSheetState) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Choose Your Avatar",
                style: TextStyle(
                  color: ColorPallete.generalTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 350,
                child: GridView.builder(
                  itemCount: avatars.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    final isSelected = selectedAvatarIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setSheetState(() {});
                        onAvatarSelected(index);
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: isSelected
                              ? Border.all(
                                  color: ColorPallete.primaryColor,
                                  width: 3,
                                )
                              : null,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(avatars[index], fit: BoxFit.cover),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
