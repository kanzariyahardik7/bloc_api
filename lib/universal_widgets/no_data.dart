import 'package:bloc_api/universal_widgets/myimage.dart';
import 'package:bloc_api/universal_widgets/mytext.dart';
import 'package:flutter/material.dart';

class NoData extends StatefulWidget {
  final String? title;
  final String? subTitle;
  final Color? titleColor;
  final Color? subTitleColor;
  const NoData(
      {super.key,
      this.title,
      this.subTitle,
      this.titleColor,
      this.subTitleColor});

  @override
  State<NoData> createState() => _NoDataState();
}

class _NoDataState extends State<NoData> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyImage(
              height: MediaQuery.sizeOf(context).height * 0.2,
              imagePath: "not_found.png",
              fit: BoxFit.cover),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.75,
            child: MyText(
              text: widget.title ?? "",
              fontsize: 18,
              maxlines: 2,
              textalign: TextAlign.center,
              color: widget.titleColor ?? const Color(0xFF000000),
              fontweight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.75,
            child: MyText(
              text: widget.subTitle ?? "",
              fontsize: 14,
              maxlines: 2,
              textalign: TextAlign.center,
              color: widget.subTitleColor ?? const Color(0xFF969494),
              fontweight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
