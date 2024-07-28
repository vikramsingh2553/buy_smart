import 'package:buy_smart/product/shared/string_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool light1 = false;
  bool light2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    StringConst.notifications,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      right: 70.0,
                    ),
                    child: SizedBox(
                      height: 5,
                      width: 54,
                      child: Divider(
                        thickness: 2,
                        color: Color(0xff52CFAC),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 260,
                        child: Text(
                          StringConst.allowNotification,
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Switch(
                        value: light1,
                        onChanged: (bool value) {
                          setState(() {
                            light1 = value;
                          });
                        },
                        trackColor: MaterialStatePropertyAll<Color>(
                            Colors.grey.shade300),
                        thumbColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.selected)) {
                            return const Color(0xff5351C7);
                          }
                          return Colors.grey;
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 290,
                    child: Text(
                     StringConst.ensureNotification,
                      style: GoogleFonts.montserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 260,
                        child: Text(
                         StringConst.allowUpdate,
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Switch(
                        value: light2,
                        onChanged: (bool value) {
                          setState(() {
                            light2 = value;
                          });
                        },
                        trackColor: MaterialStatePropertyAll<Color>(
                            Colors.grey.shade300),
                        thumbColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.selected)) {
                            return const Color(0xff5351C7);
                          }
                          return Colors.grey;
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 290,
                    child: Text(
                      StringConst.getUpdate,
                      style: GoogleFonts.montserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
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
}
