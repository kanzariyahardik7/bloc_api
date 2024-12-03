import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextOverflow? textoverflow;
  final int? maxlines;
  final double? latterSpacing;
  final double? height;
  final TextAlign? textalign;
  final double? fontsize;
  final Color? color;
  final FontWeight? fontweight;
  final FontStyle? fontstyle;
  final bool? multilanguage;
  final Color? decorationColor;
  final TextDecoration? decoration;

  const MyText(
      {required this.text,
      this.textoverflow,
      this.maxlines,
      this.textalign,
      this.fontsize,
      this.latterSpacing,
      this.height,
      this.color,
      this.fontweight,
      this.fontstyle,
      this.multilanguage,
      this.decoration,
      super.key,
      this.decorationColor});

  @override
  Widget build(BuildContext context) {
    if (multilanguage == true) {
      return LocaleText(
        text,
        overflow: textoverflow,
        maxLines: maxlines,
        textAlign: textalign,
        style: TextStyle(
          // fontFamily: GenniAppTheme.fontName,
          fontSize: fontsize,
          color: color,
          letterSpacing: latterSpacing,
          height: height,
          fontWeight: fontweight,
          fontStyle: fontstyle,
          decorationColor: decorationColor,
          decoration: decoration,
        ),
      );
    } else {
      return Text(
        text,
        overflow: textoverflow,
        maxLines: maxlines,
        textAlign: textalign,
        style: TextStyle(
          // fontFamily: GenniAppTheme.fontName,
          fontSize: fontsize,
          color: color,
          letterSpacing: latterSpacing,
          height: height,
          decoration: decoration,
          fontWeight: fontweight,
          decorationColor: decorationColor,
          fontStyle: fontstyle,
        ),
      );
    }
  }
}
