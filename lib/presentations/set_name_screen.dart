import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../application/authentication_service.dart';
import '../common_widgets/rounded_elevated_button.dart';
import '../data/player_repository.dart';
import '../domain/player_model.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_icons.dart';

class SetNameScreen extends StatefulWidget {
  final Player? player;
  const SetNameScreen({super.key, this.player});

  @override
  State<SetNameScreen> createState() => _SetNameScreenState();
}

class _SetNameScreenState extends State<SetNameScreen> {
  final _setNameFormKey = GlobalKey<FormState>();

  TextEditingController nameTextEditingController = TextEditingController();

  bool isValidatingSetName = false;

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
              key: _setNameFormKey,
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
                        Text("Set name", style: TextStyle(color: CustomColors.light, fontSize: 24, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 40),
                        TextFormField(
                          controller: nameTextEditingController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please provide your name';
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: CustomColors.light,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          keyboardType: TextInputType.name,
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
                              child: CustomIcons.name(CustomColors.light),
                            ),
                            hintText: 'Name',
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
                            onPressed: isValidatingSetName ? null : () async {

                              setState(() {
                                isValidatingSetName = true;
                              });
                              if (_setNameFormKey.currentState!.validate()) {
                                User user = FirebaseAuth.instance.currentUser!;
                                AuthenticationService.setName(
                                  user,
                                  nameTextEditingController.text,
                                );
                                if (widget.player == null) {
                                  Player? player = PlayerRepository.initDoc(user.email!, user.uid, nameTextEditingController.text);
                                  Navigator.pop(context, player);
                                } else {

                                }
                              }

                              setState(() {
                                isValidatingSetName = false;
                              });
                            },
                            backgroundColor: CustomColors.primaryAccent,
                            overlayColor: CustomColors.primaryBackground,
                            child: isValidatingSetName
                                ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: CustomColors.primaryBackground))
                                : Text("SUBMIT", style: TextStyle(color: CustomColors.primaryBackground, fontSize: 16, fontWeight: FontWeight.w800)),
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
    nameTextEditingController.dispose();
    super.dispose();
  }
}
