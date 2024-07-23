import 'package:buy_smart/product/shared/string_const.dart';
import 'package:buy_smart/product/ui/delivery_address_screen.dart';
import 'package:buy_smart/product/ui/feedback_screen.dart';
import 'package:buy_smart/product/ui/notification_screen.dart';
import 'package:buy_smart/product/ui/payment_screen.dart';
import 'package:buy_smart/product/ui/setting_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  void showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text(StringConst.gallery),
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text(StringConst.camera),
                onTap: () {
                  pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text(StringConst.myProfile),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showPicker(context);
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: image != null ? FileImage(image!) : null,
                      child: image == null
                          ? const Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 40,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConst.abc,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        StringConst.gmail,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 28),
              ListTile(
                leading: const Icon(Icons.shopping_bag),
                title: const Text(StringConst.myOrders),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                ),
                onTap: () {},
              ),

              Divider(color: Colors.grey.shade300),
              ListTile(
                leading: const Icon(Icons.account_box_outlined),
                title: const Text(StringConst.myDetails),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                ),
                onTap: () {},
              ),
              Divider(color: Colors.grey.shade300),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text(StringConst.deliveryAddress),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const DeliveryAddressScreen(),
                    ),
                  );
                },
              ),
              Divider(color: Colors.grey.shade300),
              ListTile(
                leading: const Icon(Icons.payment_outlined),
                title: const Text(StringConst.paymentMethod),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const PaymentScreen(),
                    ),
                  );
                },
              ),
              Divider(color: Colors.grey.shade300),

              ListTile(
                leading: const Icon(Icons.notifications_none),
                title: const Text(StringConst.notifications),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const NotificationScreen(),
                    ),
                  );
                },
              ),
              Divider(color: Colors.grey.shade300),

              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text(StringConst.setting),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingScreen(),
                    ),
                  );
                },
              ),
              Divider(color: Colors.grey.shade300),
              ListTile(
                leading: const Icon(Icons.feedback_outlined),
                title: const Text(StringConst.feedback),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FeedbackScreen(),
                    ),
                  );
                },
              ),
              Divider(color: Colors.grey.shade300),

              ListTile(
                leading: const Icon(Icons.help_outline),
                title: const Text(StringConst.help),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                ),
                onTap: () {
                },
              ),
              Divider(color: Colors.grey.shade300),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text(StringConst.about),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                ),
                onTap: () {},
              ),
              Divider(color: Colors.grey.shade300),

            ],
          ),
        ),
      ),
    );
  }
}
