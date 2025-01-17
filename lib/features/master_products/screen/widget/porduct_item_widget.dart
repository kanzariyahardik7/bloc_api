import 'package:bloc_api/features/master_products/model/product_list_model.dart';
import 'package:bloc_api/resource/colors.dart';
import 'package:bloc_api/universal_widgets/mynetworkimage.dart';
import 'package:bloc_api/universal_widgets/mytext.dart';
import 'package:flutter/widgets.dart';

class PorductItemWidget extends StatefulWidget {
  final MasterProductItemModel productItemData;
  const PorductItemWidget({super.key, required this.productItemData});

  @override
  State<PorductItemWidget> createState() => _PorductItemWidgetState();
}

class _PorductItemWidgetState extends State<PorductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyNetworkImage(
            imgHeight: MediaQuery.sizeOf(context).height * 0.2,
            imgWidth: MediaQuery.sizeOf(context).width,
            imageUrl: widget.productItemData.media!.isEmpty
                ? ""
                : widget.productItemData.media?[0].fullUrl,
            fit: BoxFit.cover),
        MyText(
          text: widget.productItemData.name ?? "",
          color: red,
          fontsize: 18,
          fontweight: FontWeight.bold,
        )
      ],
    );
  }
}
