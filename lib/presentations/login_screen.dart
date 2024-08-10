import 'package:flutter/material.dart';
import 'package:howl_and_seek/presentations/parent_screen.dart';

import '../common_widgets/rounded_elevated_button.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_icons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController test = TextEditingController();

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
                      Text("LOG-IN", style: TextStyle(color: CustomColors.light, fontSize: 24, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 40),
                      TextFormField(
                        validator: (value) {
                          // if (value == null || value.isEmpty) {
                          //   return 'Please provide your email address';
                          // }
                          // return null;
                        },
                        style: TextStyle(
                          color: CustomColors.light,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        controller: test,
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
                        validator: (value) {
                          // if (value == null || value.isEmpty) {
                          //   return 'Please provide your email address';
                          // }
                          // return null;
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
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ParentScreen(),));
                          },
                          backgroundColor: CustomColors.primaryAccent,
                          overlayColor: CustomColors.primaryBackground,
                          child: Text("LOG-IN", style: TextStyle(color: CustomColors.primaryBackground, fontSize: 16, fontWeight: FontWeight.w800)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 110),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
