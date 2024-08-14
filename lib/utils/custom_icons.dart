import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcons{
  static Widget name(Color color) => SvgPicture.asset("graphics/icons/Icon-Name.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget email(Color color) => SvgPicture.asset("graphics/icons/Icon-Email.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget password(Color color) => SvgPicture.asset("graphics/icons/Icon-Password.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget confirmPassword(Color color) => SvgPicture.asset("graphics/icons/Icon-ConfirmPassword.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));

  static Widget pawsBig(Color color) => SvgPicture.asset("graphics/icons/Icon-BigPaws.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget savageMark(Color color) => SvgPicture.asset("graphics/icons/Icon-SavageMark.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget huntsGamble(Color color) => SvgPicture.asset("graphics/icons/Icon-HuntsGamble.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget moonlitWard(Color color) => SvgPicture.asset("graphics/icons/Icon-MoonlitWard.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget bloodLash(Color color) => SvgPicture.asset("graphics/icons/Icon-Bloodlash.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));

  static Widget coin = SvgPicture.asset("graphics/icons/Icon-Coin.svg");
  static Widget shield = SvgPicture.asset("graphics/icons/Icon-Shield.svg");

  static Widget cursedMark(Color color) => SvgPicture.asset("graphics/icons/Icon-CursedMark.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget paws(Color color) => SvgPicture.asset("graphics/icons/Icon-Paws.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget user(Color color) => SvgPicture.asset("graphics/icons/Icon-User.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget maintenance(Color color) => SvgPicture.asset("graphics/icons/Icon-Maintenance.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));

  static Widget home(Color color) => SvgPicture.asset("graphics/icons/Icon-Home.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget ranks(Color color) => SvgPicture.asset("graphics/icons/Icon-Ranks.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget info(Color color) => SvgPicture.asset("graphics/icons/Icon-Info.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));

  static Widget howl(Color color) => SvgPicture.asset("graphics/icons/Icon-Howl.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget receive(Color color) => SvgPicture.asset("graphics/icons/Icon-Receive.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  static Widget seek(Color color) => SvgPicture.asset("graphics/icons/Icon-Seek.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));

  // static Widget wallet(Color color) =>  SvgPicture.asset("icons/Icon-Wallet.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  // static Widget discover(Color color) =>  SvgPicture.asset("icons/Icon-Discover.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  // static Widget profile(Color color) =>  SvgPicture.asset("icons/Icon-Profile.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  //
  // static Widget dark_mode(Color color) =>  SvgPicture.asset("icons/Icon-DarkMode.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  // static Widget user_profile(Color color) =>  SvgPicture.asset("icons/Icon-UserProfile.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  // static Widget security(Color color) =>  SvgPicture.asset("icons/Icon-Security.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  // static Widget link_to_socials(Color color) =>  SvgPicture.asset("icons/Icon-LinkToSocials.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  // static Widget authorized_access(Color color) =>  SvgPicture.asset("icons/Icon-AuthorizedAccess.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  //
  // static Widget back_arrow(Color color) => SvgPicture.asset("icons/Icon-BackArrow.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn),);
  //
  // static Widget mini_location(Color color) =>  SvgPicture.asset("icons/deal_card/Icon-Location.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  // static Widget mini_time(Color color) =>  SvgPicture.asset("icons/deal_card/Icon-Time.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  // static Widget mini_date(Color color) =>  SvgPicture.asset("icons/deal_card/Icon-Date.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  // static Widget mini_check(Color color) =>  SvgPicture.asset("icons/deal_card/Icon-Check.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  //
  // static Widget return_arrow(Color color) =>  SvgPicture.asset("icons/Icon-Return.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  // static Widget plus(Color color) =>  SvgPicture.asset("icons/Icon-Plus.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  // static Widget search(Color color) =>  SvgPicture.asset("icons/Icon-Search.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  // static Widget long_arrow(Color color) =>  SvgPicture.asset("icons/Icon-Long-Arrow.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  // static Widget location(Color color) =>  SvgPicture.asset("icons/Icon-Location.svg", colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
}