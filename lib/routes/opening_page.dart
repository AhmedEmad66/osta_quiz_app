import 'package:flutter/material.dart';

import '../res/my_colors.dart';
import '../res/my_images.dart';
import '../res/my_strings.dart';
import 'login_Page.dart';

class OpeningPage extends StatelessWidget {
  const OpeningPage({super.key});
  static String id = "OpeningPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kPrimaryColor,
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            AppImages.kOpeningBG,
            width: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  AppImages.kAppLogo,
                  width: 170,
                  height: 170,
                ),
                const SizedBox(
                  height: 20,
                ),
                // App Name
                const Text(
                  AppStrings.kAppName,
                  style: TextStyle(
                    fontFamily: "MyFont",
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // Slogan
                const Text(
                  AppStrings.kSlogan,
                  style: TextStyle(
                    fontFamily: "MyFont",
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 223, 227, 227),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                // Get Start BTN
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  width: 180,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: const Color.fromARGB(255, 0, 204, 255)),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, LoginPage.id);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    // btn Name
                    child: const Center(
                      child: Text(
                        "Get Start",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 251, 251, 251),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
