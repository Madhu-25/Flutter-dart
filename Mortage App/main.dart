import 'package:flutter/material.dart';
import 'package:mortgage_payment_starter_app/ui/mortgage_app.dart';
import 'package:mortgage_payment_starter_app/util/colors.dart';


final ThemeData _mortageTheme = _buildMortageThemeData();

ThemeData _buildMortageThemeData()
{
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor:  primaryIndigoDark,
    primaryColor: primaryIndigo200,
    scaffoldBackgroundColor: secondaryBackgroundWhite,
    hintColor: textOnPrimaryBlack,
    cardColor: primaryIndigoLight,
    textTheme: _buildMortageTextTheme(base.textTheme),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: primaryIndigoDark),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      )
    )


  );

}

TextTheme _buildMortageTextTheme(TextTheme base) {

  return base.copyWith(
    body1: TextStyle(
      color: textOnPrimaryBlack,
      fontSize: 18,

    ),
  ).apply(
    fontFamily: "Sans"
  );

}
void main() => runApp(new MaterialApp(
  theme: _buildMortageThemeData(),
  home: MortgageApp(),

));