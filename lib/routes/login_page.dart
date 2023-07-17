import 'package:flutter/material.dart';
import 'package:osta_quiz_app/routes/signup_page.dart';

import '../res/my_colors.dart';
import '../res/my_images.dart';
import '../res/my_strings.dart';
import 'categories_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  static String id = "LoginPage";

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  final RegExp userReg = RegExp(r'^[A-Z].{8,}$');

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
            top: MediaQuery.of(context).size.height * 1 / 8,
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
            // Login Container
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 2 / 3.4,
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
                      "Login",
                      style: TextStyle(
                        fontFamily: "MyFont",
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // userName
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "New to Quiz? ",
                          style: TextStyle(
                            color: Color.fromRGBO(133, 132, 132, 1),
                          ),
                        ),
                        // register btn
                        GestureDetector(
                          onTap: () {
                            Navigator.popAndPushNamed(context, SignUpPage.id);
                          },
                          child: const Text(
                            "Register?",
                            style: TextStyle(
                              color: AppColors.kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // login btn
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 40),
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
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const Spacer(),
                    // remember me & forget pass
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                                height: 10,
                                child: Checkbox(
                                  value: true,
                                  onChanged: (value) {},
                                  activeColor: AppColors.kPrimaryColor,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Remember Me",
                                style: TextStyle(
                                  color: Color.fromRGBO(133, 132, 132, 1),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: AppColors.kPrimaryColor,
                              ),
                            ),
                          ),
                        ],
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
