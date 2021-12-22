import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget myCachedNetworkImage(url, {double? borderRadius}) {
  return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(borderRadius ?? 0),
                bottomRight: Radius.circular(borderRadius ?? 0),
                topLeft: Radius.circular(borderRadius ?? 0),
                topRight: Radius.circular(borderRadius ?? 0),
              ),
              image: DecorationImage(
                image: imageProvider,
                alignment: Alignment.topCenter,
                fit: BoxFit.fill,
              ),
            ),
          ),
      placeholder: (context, url) => Image.asset(
            "assets/images/background.png",
            fit: BoxFit.fill,
          ),
      fadeInCurve: Curves.easeIn,
      fadeOutCurve: Curves.easeOut,
      fadeInDuration: const Duration(milliseconds: 700),
      fadeOutDuration: const Duration(milliseconds: 300),
      placeholderFadeInDuration: const Duration(milliseconds: 700),
      useOldImageOnUrlChange: true,
      errorWidget: (context, url, error) {
        return IconButton(
          icon: const Icon(Icons.error),
          onPressed: () {},
        );
      });
}
