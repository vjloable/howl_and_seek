import 'package:flutter/material.dart';

import '../application/authentication_service.dart';
import '../common_widgets/rounded_elevated_button.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_icons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerFormKey = GlobalKey<FormState>();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmationPasswordTextEditingController = TextEditingController();

  bool isValidatingRegister = false;

  void showValidationResponse(String message, Color contentColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: CustomColors.light, fontWeight: FontWeight.w600)),
        backgroundColor: CustomColors.error,
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.none,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 80,
          right: 30,
          left: 30,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: CustomColors.premiumBackground,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: _registerFormKey,
              child: Column(
                children: [
                  const SizedBox(height: 110),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 100,
                          child: RoundedElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            backgroundColor: Colors.transparent,
                            overlayColor: CustomColors.light,
                            borderColor: CustomColors.light,
                            height: 30,
                            child: Text("BACK", style: TextStyle(color: CustomColors.light, fontSize: 12, fontWeight: FontWeight.w400)),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 120),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Text("REGISTER", style: TextStyle(color: CustomColors.light, fontSize: 24, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 40),
                        TextFormField(
                          controller: emailTextEditingController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please provide your email address';
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: CustomColors.light,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.left,
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            errorStyle: TextStyle(
                              color: CustomColors.error,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: CustomColors.error),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: CustomColors.light),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: CustomColors.light.withOpacity(0.2)),
                            ),
                            isCollapsed: false,
                            contentPadding: const EdgeInsets.fromLTRB(0, 5, 45, 8),
                            fillColor: CustomColors.secondaryBackground,
                            filled: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 20),
                              child: CustomIcons.email(CustomColors.light),
                            ),
                            hintText: 'Email Address',
                            hintStyle: TextStyle(
                              color: CustomColors.light,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: passwordTextEditingController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please provide your password';
                            }
                            String pattern = r'^[a-zA-Z0-9]{8,}$';
                            RegExp regex = RegExp(pattern);
                            if (!regex.hasMatch(value)) {
                              return 'Please enter at least 8 alphanumeric characters';
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: CustomColors.light,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            errorStyle: TextStyle(
                              color: CustomColors.error,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: CustomColors.error),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: CustomColors.light),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: CustomColors.light.withOpacity(0.2)),
                            ),
                            isCollapsed: false,
                            contentPadding: const EdgeInsets.fromLTRB(0, 5, 45, 8),
                            fillColor: CustomColors.secondaryBackground,
                            filled: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 20),
                              child: CustomIcons.password(CustomColors.light),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: CustomColors.light,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: confirmationPasswordTextEditingController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            if (value != passwordTextEditingController.text && passwordTextEditingController.text.isNotEmpty) {
                              return 'Please confirm your password correctly';
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: CustomColors.light,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            errorStyle: TextStyle(
                              color: CustomColors.error,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: CustomColors.error),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: CustomColors.light),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: CustomColors.light.withOpacity(0.2)),
                            ),
                            isCollapsed: false,
                            contentPadding: const EdgeInsets.fromLTRB(0, 5, 45, 8),
                            fillColor: CustomColors.secondaryBackground,
                            filled: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 20),
                              child: CustomIcons.confirmPassword(CustomColors.light),
                            ),
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(
                              color: CustomColors.light,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 70),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: RoundedElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            backgroundColor: Colors.transparent,
                            overlayColor: CustomColors.light,
                            borderColor: CustomColors.light,
                            child: Text("CANCEL", style: TextStyle(color: CustomColors.light, fontSize: 16, fontWeight: FontWeight.w800)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          child: RoundedElevatedButton(
                            onPressed: isValidatingRegister ? null : () async {
                              (String, dynamic) validation = ("fail", "No values in input fields");
                              setState(() {
                                isValidatingRegister = true;
                              });
                              if (_registerFormKey.currentState!.validate()) {
                                validation = await AuthenticationService.signUpWithEmailAndPassword(
                                    emailTextEditingController.text.trim(),
                                    passwordTextEditingController.text
                                );
                              }
                              if (validation.$1 == "fail" && validation.$2 != "") {
                                showValidationResponse("ERROR: ${validation.$2}", CustomColors.error);
                                setState(() {
                                  isValidatingRegister = false;
                                });
                              }

                            },
                            backgroundColor: CustomColors.primaryAccent,
                            overlayColor: CustomColors.primaryBackground,
                            child: isValidatingRegister
                                ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: CustomColors.primaryBackground))
                                : Text("REGISTER", style: TextStyle(color: CustomColors.primaryBackground, fontSize: 16, fontWeight: FontWeight.w800)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    confirmationPasswordTextEditingController.dispose();
    super.dispose();
  }
}
