import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:howl_and_seek/application/authentication_service.dart';
import 'package:howl_and_seek/presentations/parent_screen.dart';
import 'package:howl_and_seek/presentations/set_name_screen.dart';
import 'package:howl_and_seek/utils/custom_colors.dart';

import '../data/player_repository.dart';
import '../domain/player_model.dart';

class RedirectScreen extends StatefulWidget {
  const RedirectScreen({super.key});

  @override
  State<RedirectScreen> createState() => _RedirectScreenState();
}

class _RedirectScreenState extends State<RedirectScreen> {
  User user = FirebaseAuth.instance.currentUser!;

  void _checkPlayer() {
    PlayerRepository.getDoc(user.uid).then((player) async {
      if (player == null) {
        try {
          if (!mounted) return;
          Player? playerFromSetName = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SetNameScreen()));
          if (playerFromSetName == null) {
            if (!mounted) return;
            Navigator.pop(context);
            AuthenticationService.signOut();
          } else {
            if (!mounted) return;
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ParentScreen(player: playerFromSetName)));
          }
        } catch (e) {
          print(e);
        }
      }
      else {
        if (player.isLocked) {
          //TODO: Add a account locked screen
        } else {
          switch (player.permissionLevel) {
            case 0:
              if (!mounted) return;
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ParentScreen(player: player)));
              break;
          }
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _checkPlayer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondaryBackground,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  CustomColors.primaryBackground,
                  CustomColors.secondaryBackground,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: SizedBox(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                  color: CustomColors.primaryAccent,
                  strokeWidth: 5,
                  value: null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
