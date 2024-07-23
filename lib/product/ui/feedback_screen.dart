import 'package:buy_smart/product/shared/string_const.dart';
import 'package:buy_smart/product/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum RadioButtonValue { first, second, third }

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  RadioButtonValue? _selectedValue;
  int _iconColor = 0;

  final List<String> ratingTexts = [
    StringConst.reteUs,
    StringConst.veryDissatisfied,
    StringConst.dissatisfied,
    StringConst.neutral,
    StringConst.satisfied,
    StringConst.verySatisfied,
    ''
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringConst.feedback,
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 1,
                    ),
                    Text(
                      StringConst.loveToHear,
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: const Color(0xff29286E),
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      StringConst.howSatisfied,
                      style: GoogleFonts.montserrat(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          ratingTexts[_iconColor],
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: List.generate(6, (index) {
                        return Expanded(
                          child: IconButton(
                            icon: Icon(
                              Icons.star_rate,
                              color: _iconColor > index
                                  ? Colors.blue
                                  : const Color(0xffEEEEEE),
                              size: 55,
                            ),
                            onPressed: () {
                              setState(() {
                                _iconColor = _iconColor == index + 1 ? 0 : index + 1;
                              });
                            },
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                     StringConst.likeMost,
                      style: GoogleFonts.montserrat(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      color: const Color(0xffEEEEEE),
                      height: 100,
                      width: double.infinity,
                      child: TextField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: StringConst.iLiked,
                          hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                     StringConst.thinkImprove,
                      style: GoogleFonts.montserrat(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      color: const Color(0xffEEEEEE),
                      height: 110,
                      width: double.infinity,
                      child: TextField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: StringConst.typeAns,
                          hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      StringConst.youRecommend,
                      style: GoogleFonts.montserrat(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio<RadioButtonValue>(
                              activeColor: Colors.blue,
                              value: RadioButtonValue.first,
                              groupValue: _selectedValue,
                              onChanged: (RadioButtonValue? value) {
                                setState(() {
                                  _selectedValue = value;
                                });
                              },
                            ),
                            Text(
                              StringConst.yesDefinitely,
                              style: GoogleFonts.montserrat(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<RadioButtonValue>(
                              activeColor: Colors.blue,
                              value: RadioButtonValue.second,
                              groupValue: _selectedValue,
                              onChanged: (RadioButtonValue? value) {
                                setState(() {
                                  _selectedValue = value;
                                });
                              },
                            ),
                            Text(
                              StringConst.mayBe,
                              style: GoogleFonts.montserrat(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<RadioButtonValue>(
                              activeColor: Colors.blue,
                              value: RadioButtonValue.third,
                              groupValue: _selectedValue,
                              onChanged: (RadioButtonValue? value) {
                                setState(() {
                                  _selectedValue = value;
                                });
                              },
                            ),
                            Text(
                              StringConst.notAtMoment,
                              style: GoogleFonts.montserrat(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        StringConst.thankTime,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff009394),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                  StringConst.immediateSupport,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: StringConst.here,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  const ProfileScreen(),
                  ),
                );              },
              child: Center(
                child: Container(
                  height: 55,
                  width: 240,
                  decoration: BoxDecoration(
                    color: const Color(0xff32856E),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      StringConst.submit,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}








