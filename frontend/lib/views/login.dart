import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:frontend/constants/color_contants.dart';
import 'package:frontend/views/register.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                    "Welcome to E commerce App",
                    style: TextStyle(
                      color: Color(0xf0223263),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Text(
                  "Sign in to continue",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xf09098B1),
                    fontWeight: FontWeight.normal,
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
                      "Sign In",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Container(
                        color: Color(ColorConstants.primaryGrey),
                        width: MediaQuery.of(context).size.width * 0.41,
                        height: 1,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "OR",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xf09098B1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        color: Color(ColorConstants.primaryGrey),
                        width: MediaQuery.of(context).size.width * 0.41,
                        height: 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SignInButton(
                    Buttons.Google,
                    onPressed: () {},
                    text: "Login with Google",
                    padding: const EdgeInsets.symmetric(vertical: 5),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SignInButton(
                    Buttons.Facebook,
                    onPressed: () {},
                    text: "Login with Facebook",
                    padding: const EdgeInsets.symmetric(vertical: 5),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Color(ColorConstants.primaryGrey),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.to(const Register()),
                      child: Text(
                        "Register",
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
