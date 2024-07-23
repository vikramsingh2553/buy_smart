import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  bool salesNotification = false;
  bool newArrivalNotification = false;
  bool deliveryStatusNotification = false;
  TextEditingController dobController = TextEditingController();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    dobController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text('Setting'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Personal Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Card(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white70),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      hintText: 'Full Name',
                      hintStyle: TextStyle(color: Colors.black26),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white70),
                  child: TextFormField(
                    controller: dobController,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      hintText: 'Date of Birth',
                      hintStyle: TextStyle(color: Colors.black26),
                      border: InputBorder.none,
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectDate(context);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      showPasswordChangeBottomSheet(context);
                    },
                    child: const Text(
                      'Change',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Card(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white70),
                  child: TextFormField(
                    onTap: () {
                      showPasswordChangeBottomSheet(context);
                    },
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black26),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Notifications',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  const Expanded(
                    child: Text('Sales'),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: salesNotification,
                      onChanged: (value) {
                        setState(() {
                          salesNotification = value;
                        });
                      },
                      activeColor: Colors.red,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  const Expanded(
                    child: Text('New Arrival'),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: newArrivalNotification,
                      onChanged: (value) {
                        setState(() {
                          newArrivalNotification = value;
                        });
                      },
                      activeColor: Colors.red,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  const Expanded(
                    child: Text('Delivery Status Changes'),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: deliveryStatusNotification,
                      onChanged: (value) {
                        setState(() {
                          deliveryStatusNotification = value;
                        });
                      },
                      activeColor: Colors.red,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  void showPasswordChangeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Password Change',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white70),
                      child: TextFormField(
                        controller: oldPasswordController,
                        cursorColor: Colors.black,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Old Password',
                          hintStyle: TextStyle(color: Colors.black26),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Card(
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white70),
                      child: TextFormField(
                        controller: newPasswordController,
                        cursorColor: Colors.black,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'New Password',
                          hintStyle: TextStyle(color: Colors.black26),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Card(
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white70),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        cursorColor: Colors.black,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(color: Colors.black26),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (newPasswordController.text ==
                          confirmPasswordController.text) {
                        // Save the new password
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Password changed successfully!'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Passwords do not match!'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Save Password',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
