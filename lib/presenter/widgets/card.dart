import 'package:flutter/material.dart';
import 'package:sinarmas/presenter/extension/color.dart';
import 'package:sinarmas/presenter/extension/fonts.dart';
import 'package:sinarmas/presenter/widgets/image.dart';

Widget baseCard(context, {required Widget child, double? borderRadius}) {
  return AnimatedContainer(
    duration: const Duration(seconds: 2),
    curve: Curves.easeIn,
    margin: const EdgeInsets.all(2),
    decoration: BoxDecoration(
      color: SinarmasColors.white,
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: const Color(0xFF323247).withOpacity(0.1),
          offset: const Offset(2, 2),
          blurRadius: 4,
        ),
        BoxShadow(
          color: const Color(0xFF323247).withOpacity(0.1),
          offset: const Offset(-2, 0),
          blurRadius: 4,
        )
      ],
    ),
    child: child,
  );
}

Widget singleCard(
  context, {
  EdgeInsets? padding,
  VoidCallback? onTap,
  required String image,
  String? title,
  String? subtitle,
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // cardIcon(context, image: image, color: color, padding: 10),
                SizedBox(height: 150, child: myCachedNetworkImage(image)),
                // Image(
                //   image: NetworkImage(image),
                //   width: MediaQuery.of(context).size.width,
                //   // height: MediaQuery.of(context).size.height / 8,
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title ?? '',
                    style: SinarmasFonts().semiBold(size: 15),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
    decoration: BoxDecoration(
      color: SinarmasColors.white,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: SinarmasColors.black.withOpacity(0.1),
          offset: const Offset(1, 2),
          // spreadRadius: 2.0,
          blurRadius: 8.0,
        )
      ],
      // border: border,
    ),
  );
}

Widget cardIcon(
  context, {
  required IconData icon,
  Color? color,
  double? size,
  required VoidCallback onTap,
  double? padding,
}) {
  return baseCard(
    context,
    child: Material(
      color: color ?? Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(padding ?? 4),
          child: Icon(
            icon,
            size: size ?? 22,
            color: SinarmasColors.black,
          ),
        ),
      ),
    ),
  );
}

Widget bullets() {
  return Container(
    width: 6,
    height: 6,
    decoration: const BoxDecoration(
      color: SinarmasColors.primary,
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
  );
}

Widget cardListTile(context,
    {Widget? leading,
    Widget? trailing,
    required String title,
    required String subtitle,
    VoidCallback? onTap}) {
  return Column(
    children: [
      ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: SinarmasFonts().semiBold(
            size: 15,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: SinarmasFonts().light(
            color: SinarmasColors.black.withOpacity(0.5),
            size: 12,
          ),
        ),
        dense: true,
        contentPadding: const EdgeInsets.all(0),
        leading: leading,
        trailing: trailing ?? const SizedBox(),
      ),
      const Divider(thickness: 1.0, color: SinarmasColors.grey),
    ],
  );
}

Widget cardWithImage(context,
    {required String image,
    required Widget child,
    double marginHorizontal = 15,
    double marginVertical = 20}) {
  return Container(
    height: 90,
    margin: EdgeInsets.symmetric(
        horizontal: marginHorizontal, vertical: marginVertical),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: SinarmasColors.white,
            borderRadius: BorderRadius.circular(8),
            // ignore: prefer_const_literals_to_create_immutables
          ),
          // ignore: unnecessary_null_comparison
          child: image != null
              ? myCachedNetworkImage(image, borderRadius: 8)
              : const SizedBox(),
        ),
        const SizedBox(
          width: 18,
        ),
        Expanded(
          child: child,
        ),
      ],
    ),
  );
}
