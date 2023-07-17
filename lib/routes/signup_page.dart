import 'package:flutter/material.dart';

import '../res/my_colors.dart';
import '../res/my_images.dart';
import '../res/my_strings.dart';
import 'categories_page.dart';
import 'login_Page.dart';

class SignUpPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final RegExp emailReg =
      RegExp(r'^[\w.%+-]+@gmail\.com$', caseSensitive: false);
  final RegExp userReg = RegExp(r'^[A-Z].{8,}$');
  SignUpPage({super.key});
  // Named Route
  static String id = "SignUpPage";

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
          Positioned(
            top: MediaQuery.of(context).size.height * 1 / 15,
            left: 0,
            right: 0,
            // Intro Pic
            child: Image.asset(
              AppImages.kLoginIntroPic,
              width: 220,
              height: 220,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            // SignUp Container
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 2 / 3.0,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 238, 238, 238),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: "MyFont",
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    // E-mail Address
                    TextFormField(
                      cursorColor: AppColors.kPrimaryColor,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                        hintText: "E-mail Address",
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(133, 132, 132, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'E-mail is required.';
                        }
                        if (value.length < 5) {
                          return 'Username must be at least 5 characters long.';
                        }
                        if (!emailReg.hasMatch(value)) {
                          return 'Enter a valid E-mail.';
                        }
                        return null;
                      },
                    ), // userName
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _nameController,
                      cursorColor: AppColors.kPrimaryColor,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                        hintText: "Username",
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(133, 132, 132, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Username is required.';
                        }
                        if (value.length < 9) {
                          return 'Username must be at least 9 characters long.';
                        }
                        if (!userReg.hasMatch(value)) {
                          return 'Username must start with a capitalized letter.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Alredy have an account! ",
                          style: TextStyle(
                            color: Color.fromRGBO(133, 132, 132, 1),
                          ),
                        ),
                        // Login btn
                        GestureDetector(
                          onTap: () {
                            Navigator.popAndPushNamed(context, LoginPage.id);
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: AppColors.kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SignUp btn
                    Container(
                      margin: const EdgeInsets.only(top: 100),
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.kPrimaryColor,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.popAndPushNamed(
                                context, CategoriesPage.id);
                            AppStrings.kUserName = _nameController.text;
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
