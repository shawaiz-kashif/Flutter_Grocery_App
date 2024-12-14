import 'package:app/common/color_extension.dart';
import 'package:app/common_widget/round_button.dart';
import 'package:app/view/login/verification.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController txtMobile = TextEditingController();
  FlCountryCodePicker countryPicker = const FlCountryCodePicker();
  late CountryCode countryCode;

  @override
  void initState() {
    super.initState();
    countryCode = countryPicker.countryCodes
        .firstWhere((element) => element.name == "Pakistan");
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/img/bottom_bg.png",
                width: media.width,
                height: media.width,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Image.asset(
            "assets/img/sign_in_top.png",
            width: media.width,
          ),
          SingleChildScrollView(
            child: SafeArea(
                child: Column(
              children: [
                SizedBox(
                  height: media.width * 1.10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "QuickMart: Where Fresh \n           Meets Fast!",
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 26,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextField(
                          controller: txtMobile,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefixIcon: GestureDetector(
                                onTap: () async {
                                  final code = await countryPicker.showPicker(
                                      context: context);

                                  if (code != null) {
                                    countryCode = code;
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  }
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      width: 35,
                                      height: 35,
                                      child: countryCode.flagImage(),
                                    ),
                                    Text(
                                      "${countryCode.dialCode}",
                                      style: TextStyle(
                                          color: TColor.primaryText,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                  ],
                                )),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Mobile Number",
                            hintStyle: TextStyle(
                                color: TColor.placeholder, fontSize: 17),
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 1,
                          color: const Color(0xffE2E2E2),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Connect with Your Socials",
                  style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RoundIconButton(
                    title: "Proceed With Google",
                    icon: "assets/img/google_logo.png",
                    bgColor: const Color(0xff5383EC),

                    //This part Connects the Verfication Screen

                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Verification()));
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RoundIconButton(
                    title: "Proceed With FaceBook",
                    icon: "assets/img/fb_logo.png",
                    bgColor: const Color(0xff4A66AC),
                    onPressed: () {},
                  ),
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
