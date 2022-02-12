import 'package:bookkikko_business/components/orders_page/sub_title_widget.dart';
import 'package:flutter/material.dart';

class OneOrderBoxSkelton extends StatelessWidget {
  OneOrderBoxSkelton({
    Key? key,
    this.lowerChild,
    this.trailing,
    this.leading,
    this.titleText,
    this.subtitle,
    this.listTileOnTap,
  }) : super(key: key);

  Widget? lowerChild;
  void Function()? listTileOnTap;
  Widget? trailing;
  Widget? leading;
  Widget? subtitle;
  String? titleText;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey.shade400,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListTile(
              onTap: listTileOnTap,
              leading: leading,
              title: (titleText != null)
                  ? Text(
                      titleText!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    )
                  : null,
              subtitle: subtitle,
              trailing: trailing),
          if (lowerChild != null) lowerChild!
        ],
      ),
    );
  }
}
