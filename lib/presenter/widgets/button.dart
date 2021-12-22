import 'package:flutter/cupertino.dart';
import 'package:sinarmas/presenter/extension/color.dart';
import 'package:sinarmas/presenter/extension/fonts.dart';

Widget primaryButton(
  context, {
  VoidCallback? onTap,
  Widget? child,
  double? padding,
  String? text,
  double? width,
}) {
  return CupertinoButton(
    onPressed: onTap,
    padding: const EdgeInsets.all(0),
    child: AnimatedContainer(
      width: width ?? MediaQuery.of(context).size.width,
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(vertical: padding ?? 15),
      decoration: BoxDecoration(
        color: onTap != null ? SinarmasColors.primary : SinarmasColors.grey,
        borderRadius: BorderRadius.circular(8),
        boxShadow: onTap != null
            ? <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFF323247).withOpacity(0.2),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                )
              ]
            : [],
      ),
      child: Center(
        child: child ??
            Text(
              text ?? 'Button',
              style: SinarmasFonts().medium().apply(
                    color: onTap != null
                        ? SinarmasColors.text
                        : SinarmasColors.black.withOpacity(0.6),
                  ),
            ),
      ),
    ),
  );
}
