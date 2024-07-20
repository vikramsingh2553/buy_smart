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
                title: const Text('Gallery'),
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
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
        title: const Text("My Profile"),
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
                        'abc',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'xyz@gmail.com',
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
                leading: Icon(Icons.shopping_bag),
                title: const Text('My Orders'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                ),
                onTap: () {},
              ),

              Divider(color: Colors.grey.shade300),
              ListTile(
                leading: Icon(Icons.account_box_outlined),
                title: const Text('My Details'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                ),
                onTap: () {},
              ),
              Divider(color: Colors.grey.shade300),
              ListTile(
                leading: Icon(Icons.location_on),
                title: const Text('Delivery Address'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  DeliveryAddressScreen(),
                    ),
                  );
                },
              ),
              Divider(color: Colors.grey.shade300),
              ListTile(
                leading: Icon(Icons.payment_outlined),
                title: const Text('Payment Methods'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  PaymentScreen(),
                    ),
                  );
                },
              ),
              Divider(color: Colors.grey.shade300),

              ListTile(
                leading: Icon(Icons.notifications_none),
                title: const Text('Notification'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  NotificationScreen(),
                    ),
                  );
                },
              ),
              Divider(color: Colors.grey.shade300),

              ListTile(
                leading: Icon(Icons.settings),
                title: const Text('Settings'),
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
                leading: Icon(Icons.feedback_outlined),
                title: const Text('Feedback'),
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
                leading: Icon(Icons.help_outline),
                title: const Text('Help'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                ),
                onTap: () {
                },
              ),
              Divider(color: Colors.grey.shade300),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: const Text('About'),
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
