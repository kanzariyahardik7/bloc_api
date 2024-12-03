import 'package:bloc_api/widget/colors.dart';
import 'package:bloc_api/widget/myimage.dart';
import 'package:bloc_api/widget/mytext.dart';
import 'package:flutter/material.dart';

class NoData extends StatefulWidget {
  final String? title;
  final String? subTitle;
  const NoData({super.key, this.title, this.subTitle});

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
              color: black,
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
              color: grey,
              fontweight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
