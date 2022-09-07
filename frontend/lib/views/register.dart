import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend/constants/color_contants.dart';
import 'package:frontend/controllers/auth_controller.dart';
import 'package:frontend/models/user_model.dart';
import 'package:frontend/views/login.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  ImagePicker picker = ImagePicker();
  Map<String, dynamic> form = {};
  File? userImage;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorConstants.primaryWhite),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo2.png',
                  fit: BoxFit.cover,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Let's Get Started",
                    style: TextStyle(
                      color: Color(0xf0223263),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Text(
                  "Create an new account",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xf09098B1),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(ColorConstants.primaryGrey).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: userImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(
                              userImage!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(Icons.add_a_photo_outlined),
                  ),
                  onTap: () async {
                    XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      setState(() {
                        userImage = File(image.path);
                      });
                      setState(() {
                        form = {...form, "image": "${File(image.path)}"};
                      });
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Full Name',
                      prefixIcon: Icon(Icons.person_outline, size: 25),
                    ),
                    onChanged: (value) => setState(() {
                      form = {...form, "name": value};
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    hint: const Text("Select Gender"),
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(10),
                    items: const [
                      DropdownMenuItem(value: "male", child: Text("Male")),
                      DropdownMenuItem(value: "female", child: Text("Famale")),
                    ],
                    onChanged: (value) => setState(() {
                      form = {...form, "gender": value};
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Your Email',
                      prefixIcon: Icon(Icons.email_outlined, size: 25),
                    ),
                    onChanged: (value) => setState(() {
                      form = {...form, "email": value};
                    }),
                  ),
                ),
                TextFormField(
                  obscureText: obscureText,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline, size: 25),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Icon(
                        obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 25,
                      ),
                    ),
                  ),
                  onChanged: (value) => setState(() {
                    form = {...form, "password": value};
                  }),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 47,
                  margin: const EdgeInsets.only(top: 10, bottom: 21),
                  child: GetBuilder<AuthController>(
                    init: AuthController(),
                    builder: (controller) {
                      return ElevatedButton(
                        onPressed: () {
                          controller.signUp(form);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(ColorConstants.primaryBlue),
                          elevation: 5,
                          shadowColor: Color(ColorConstants.primaryBlue),
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Color(ColorConstants.primaryGrey),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.to(const Login()),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(ColorConstants.primaryBlue),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
