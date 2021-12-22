import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sinarmas/presenter/extension/color.dart';
import '../extension/margin_helper.dart';

Widget loadingGrid(context, int? lengthItem) {
  return StaggeredGridView.countBuilder(
    itemCount: lengthItem ?? 4,
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    crossAxisCount: 2,
    staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
    itemBuilder: (_, index) {
      return Shimmer.fromColors(
        baseColor: const Color(0xFFEDF3F6).withOpacity(0.5),
        highlightColor: SinarmasColors.text,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            color: const Color(0xFFEDF3F6),
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
        ),
      );
    },
  );
}

Widget myShimmer({required Widget child}) {
  return Shimmer.fromColors(
    child: child,
    baseColor: const Color(0xFFEDF3F6).withOpacity(0.5),
    highlightColor: SinarmasColors.text,
  );
}

Widget stripLoading(context, {required double height, double? width}) {
  return myShimmer(
    child: Container(
      height: height,
      width: width ?? 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
    ),
  );
}

Widget loadingRow(context, {int? data, double? width, double? height}) {
  return Container(
    constraints: BoxConstraints(maxHeight: height ?? 22),
    child: ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(0),
      children: List.generate(data ?? 3, (index) {
        return stripLoading(context, height: height ?? 22, width: width ?? 100)
            .marginRight(20);
      }),
    ),
  );
}
