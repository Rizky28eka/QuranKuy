import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qurankuy_2/pages/homepage.dart';
import 'package:qurankuy_2/widgets/icon_rounded.dart';
import 'package:qurankuy_2/widgets/textfield/CustTextField.dart';
import 'package:qurankuy_2/widgets/textfield/EmailTextField.dart';
import 'package:qurankuy_2/widgets/textfield/PasswordTextField.dart';
import '../../widgets/AppStyle.dart';
import '../../widgets/button/Btn_Txt.dart';
import '../../widgets/button/Cust_Btn.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  bool isPasswordMatch() {
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    return password == confirmPassword;
  }

  void navigateToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Align(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/IcApp.png',
                width: 80,
              ),
              SizedBox(height: 10),
              Text(
                "Let's Register",
                style: GoogleFonts.montserrat(
                  color: AppColors.FontColorWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              CustTextField(
                  controller: TextEditingController(), hintText: 'Username'),
              SizedBox(height: 20),
              EmailTextField(
                  controller: TextEditingController(), hintText: 'Email'),
              SizedBox(height: 20),
              PasswordTextField(
                  controller: TextEditingController(), hintText: "Password"),
              SizedBox(height: 20),
              PasswordTextField(
                  controller: TextEditingController(),
                  hintText: "Re-Type Password"),
              SizedBox(height: 20),
              CustomButton(
                text: 'Login',
                buttonColor: AppColors.ButtonColor,
                width: 250,
                height: 15,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an Account?",
                    style: GoogleFonts.montserrat(
                      color: AppColors.FontColorWhite,
                      fontSize: 12,
                    ),
                  ),
                  CustomTextButton(
                    text: "LOGIN",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    textStyle:
                        TextStyle(fontSize: 12.0, color: AppColors.ButtonColor),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "OR",
                        style: GoogleFonts.crimsonText(
                          fontSize: 18,
                          color: AppColors.FontColorWhite,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 30,
                      height: 30,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: IconRounded(
                        imagePath: 'assets/icons/IcGoogle.png',
                        iconSize: 30.0,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 30,
                      height: 30,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: IconRounded(
                        imagePath: 'assets/icons/IcFacebook.png',
                        iconSize: 30.0,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
