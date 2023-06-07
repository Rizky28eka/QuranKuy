import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/style.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void navigateToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
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
                "Welcome Back",
                style: GoogleFonts.montserrat(
                  color: AppColors.FontColorWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 310,
                height: 40,
                child: TextFormField(
                  cursorColor: Colors.white,
                  style:
                      GoogleFonts.montserrat(color: AppColors.FontColorWhite),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    fillColor: AppColors.FontColorBlue,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Email",
                    hintStyle: GoogleFonts.montserrat(
                      color: AppColors.FontColorWhite,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 310,
                height: 40,
                child: TextFormField(
                  controller: passwordController,
                  cursorColor: Colors.white,
                  obscureText: hidePassword,
                  style:
                      GoogleFonts.montserrat(color: AppColors.FontColorWhite),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    fillColor: AppColors.FontColorBlue,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Password",
                    hintStyle: GoogleFonts.montserrat(
                      color: AppColors.FontColorWhite,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      child: Icon(
                        hidePassword ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.FontColorWhite,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 295,
                height: 45,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.ButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account?",
                    style: GoogleFonts.montserrat(
                      color: AppColors.FontColorWhite,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: navigateToRegisterPage,
                    child: Text(
                      "Register",
                      style: GoogleFonts.montserrat(
                        color: AppColors.ButtonColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
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
                    onTap: () {
// Action when Google icon is clicked
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/icons/IcGoogle.png',
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
// Action when Facebook icon is clicked
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/icons/IcFacebook.png',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
