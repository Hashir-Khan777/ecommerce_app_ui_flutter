import 'package:flutter/material.dart';
import 'package:frontend/constants/color_contants.dart';
import 'package:frontend/views/login.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImagePicker picker = ImagePicker();

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
                    child: const Icon(Icons.add_a_photo_outlined),
                  ),
                  onTap: () async {
                    XFile? image =
                        await picker.pickImage(source: ImageSource.camera);
                    print("image ${image?.path}");
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Full Name',
                      prefixIcon: Icon(Icons.person_outline, size: 25),
                    ),
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
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Your Email',
                      prefixIcon: Icon(Icons.email_outlined, size: 25),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline, size: 25),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 47,
                  margin: const EdgeInsets.only(top: 10, bottom: 21),
                  child: ElevatedButton(
                    onPressed: () {},
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
