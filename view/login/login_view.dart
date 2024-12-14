import 'package:app/common_widget/round_button.dart';
import 'package:app/view/MAIN-TAB/main_tabview.dart';
import 'package:app/view/login/sign_up.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/line_text_field.dart';

// class LoginView extends StatefulWidget {
//   const LoginView({super.key});

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   TextEditingController txtOTP = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.sizeOf(context);
//     var roundButton = RoundButton;
//     return Stack(
//       children: [
//         Container(
//           color: Colors.white,
//           child: Image.asset(
//             "assets/img/bottom_bg.png",
//             width: media.width,
//             height: media.width,
//             fit: BoxFit.cover,
//           ),
//         ),
//         Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               leading: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: Image.asset(
//                   "assets/img/back.png",
//                   width: 20,
//                   height: 20,
//                 ),
//               ),
//             ),
//             backgroundColor: Colors.white,
//             body: SafeArea(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         "assets/img/select_location.png",
//                         width: media.width * 0.6,
//                       ),
//                       SizedBox(
//                         height: media.width * 0.1,
//                       ),
//                       Text(
//                         "Select Your Location",
//                         style: TextStyle(
//                             color: TColor.primaryText,
//                             fontSize: 26,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       SizedBox(
//                         height: media.width * 0.03,
//                       ),
//                       Text(
//                         "Turn on location services to keep up with\nlocal events and updates",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: TColor.secondaryText,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       SizedBox(
//                         height: media.width * 0.1,
//                       ),
//                       Dropdown(
//                           title: "Your Zone",
//                           placeholder: "Select Your Zone",
//                           valueList: const ["Zone 1", "Zone 2"],
//                           didChange: (sObj) {}),
//                       SizedBox(
//                         height: media.width * 0.07,
//                       ),
//                       Dropdown(
//                           title: "Your Area",
//                           placeholder: "Area Type",
//                           valueList: const ["Area 1", "Area 2"],
//                           didChange: (sObj) {}),
//                       SizedBox(
//                         height: media.width * 0.1,
//                       ),
//                       RoundButton(
//                         title: "Submit",
//                         onPressed: () {},
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             )),
//       ],
//     );
//   }
// }

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  // final loginVM = Get.put(LoginViewModel());
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/img/back.png",
                width: 20,
                height: 20,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/img/color_logo.png",
                          width: 50,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: media.width * 0.15,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.03,
                    ),
                    Text(
                      "Enter your emails and password",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    LineTextField(
                      title: "Email",
                      placeholder: "Enter your email address",
                      controller: txtEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: media.width * 0.07,
                    ),
                    LineTextField(
                      title: "Password",
                      placeholder: "Enter your password",
                      controller: txtPassword,
                      obscureText: isShow,
                      right: IconButton(
                        onPressed: () {
                          // showPassword();
                          setState(() {
                            isShow = !isShow;
                          });
                        },
                        icon: Icon(
                          !isShow ? Icons.visibility_off : Icons.visibility,
                          color: TColor.textTittle,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Get.to(() => const ForgotPasswordView());
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: media.width * 0.05,
                    ),
                    RoundButton(
                      title: "Log In",
                      onPressed: () {
                        // serviceCallLogin();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainTabview(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: media.width * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUp(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Don’t have an account?",
                                style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Signup",
                                style: TextStyle(
                                  color: TColor.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
