import 'package:flutter/material.dart';

@immutable
class AppTypography {
  const AppTypography._();

  static const primary = _AppFontStyle.poppins;
}

@immutable
class _FontStyle {
  ///Poppins Bold 30 px
  final TextStyle bold40;

  ///Poppins Bold 30 px
  final TextStyle bold30;

  ///Poppins Bold 17px
  final TextStyle bold17;

  ///Poppins Bold 24 px
  final TextStyle bold24;

  ///Poppins Bold 15px
  final TextStyle bold15;

  ///Poppins Bold 14px
  final TextStyle bold14;

  ///Poppins Bold 12px
  final TextStyle bold12;

  ///Poppins SemiBold 20 px
  final TextStyle semiBold20;

  ///Poppins SemiBold 15px
  final TextStyle semiBold15;

  ///Poppins Medium 17px
  final TextStyle medium17;

  ///Poppins Medium 15px
  final TextStyle medium15;

  ///Poppins Medium 14px
  final TextStyle medium14;

  ///Poppins Medium 13 px
  final TextStyle medium13;

  ///Poppins Regular 17px
  final TextStyle regular17;

  ///Poppins Regular 14px
  final TextStyle regular14;

  ///Poppins Regular 12px
  final TextStyle regular12;

  ///Poppins Regular 10px
  final TextStyle regular10;

  const _FontStyle({
    required this.bold40,
    required this.bold30,
    required this.bold17,
    required this.bold24,
    required this.bold15,
    required this.bold14,
    required this.bold12,
    required this.semiBold20,
    required this.semiBold15,
    required this.medium17,
    required this.medium15,
    required this.medium14,
    required this.medium13,
    required this.regular17,
    required this.regular14,
    required this.regular12,
    required this.regular10,
  });
}

extension _AppFontStyle on _FontStyle {
  static const poppins = _FontStyle(
    bold40: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 40,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none),
    bold30: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 30,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none),
    bold17: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 17,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none),
    bold24: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none),
    bold15: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 15,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none),
    bold14: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none),
    bold12: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none),
    semiBold20: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none),
    semiBold15: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 15,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none),
    medium17: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 17,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.none),
    medium15: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 15,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.none),
    medium14: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.none),
    medium13: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 13,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.none),
    regular17: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 17,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none),
    regular14: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none),
    regular12: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none),
    regular10: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 10,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none),
  );
}
