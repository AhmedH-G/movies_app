import 'package:flutter/material.dart';
import '../../../../core/gen/assets.gen.dart';

class PickAvatarScreen extends StatefulWidget {
  const PickAvatarScreen({super.key});

  @override
  State<PickAvatarScreen> createState() => _PickAvatarScreenState();
}

class _PickAvatarScreenState extends State<PickAvatarScreen> {
  int selectedIndex = 1;
  bool showAvatars = false;

  final TextEditingController nameController = TextEditingController(
    text: "John Safwat",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "01200000000",
  );

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Pick Avatar")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              _buildAvatarPicker(),
              SizedBox(height: 30),
              _buildNameField(),
              SizedBox(height: 15),
              _buildPhoneField(),
              SizedBox(height: 20),
              _buildResetPassword(),
              SizedBox(height: 25),
              if (showAvatars) _buildAvatarsGrid(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildAppBar(BuildContext context) {
  //   return Row(
  //     children: [
  //       IconButton(
  //         onPressed: () => Navigator.pop(context),
  //         icon: Icon(
  //           Icons.arrow_back,
  //           color: Colors.yellow.withOpacity(0.4),
  //         ),
  //       ),
  //       const Spacer(),
  //       Text(
  //         "Pick Avatar",
  //         style: TextStyle(
  //           color: Colors.yellow.withOpacity(0.4),
  //           fontSize: 16,
  //           fontWeight: FontWeight.w500,
  //         ),
  //       ),
  //       const SizedBox(width: 125),
  //     ],
  //   );
  // }

  Widget _buildAvatarPicker() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            showAvatars = !showAvatars;
          });
        },
        child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.yellow.withOpacity(0.3),
          child: CircleAvatar(
            radius: 55,
            backgroundImage: AssetImage(avatars[selectedIndex]),
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return _buildEditableField(
      image: Assets.icons.User4.path,
      controller: nameController,
      keyboardType: TextInputType.name,
    );
  }

  Widget _buildPhoneField() {
    return _buildEditableField(
      image: Assets.icons.phone.path,
      controller: phoneController,
      keyboardType: TextInputType.phone,
    );
  }

  Widget _buildResetPassword() {
    return const Text(
      "Reset Password",
      style: TextStyle(color: Colors.white60, fontSize: 14),
    );
  }

  Widget _buildEditableField({
    required String image,
    required TextEditingController controller,
    required TextInputType keyboardType,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(image, width: 20, height: 20, color: Colors.white54),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              style: const TextStyle(color: Colors.white, fontSize: 15),
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarsGrid() {
    return Expanded(
      child: GridView.builder(
        itemCount: avatars.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: isSelected
                    ? Border.all(color: Colors.yellow, width: 3)
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
    );
  }
}
