import 'package:flutter/material.dart';
import 'package:sinarmas/presenter/extension/color.dart';
import 'package:sinarmas/presenter/extension/fonts.dart';
import 'package:sinarmas/presenter/extension/margin_helper.dart';

Future alertMakeSureDelete(context,
    {required String title,
    required content,
    required nama,
    required actionYes,
    VoidCallback? actionNo}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.delete,
                color: SinarmasColors.primary,
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: SinarmasFonts().bold(
                  size: 20,
                  color: SinarmasColors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: content,
                    style: SinarmasFonts().medium(
                      size: 14,
                    )),
                TextSpan(
                  text: nama,
                  style: SinarmasFonts().semiBold(
                    size: 14,
                    color: SinarmasColors.primary,
                  ),
                ),
                TextSpan(
                    text: " ?",
                    style: SinarmasFonts().medium(
                      size: 14,
                    )),
              ],
            ),
          ),
          actions: <Widget>[
            OutlinedButton(
              onPressed: actionYes,
              // style: ButtonStyle(
              //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //     const RoundedRectangleBorder(
              //         borderRadius: BorderRadius.zero,
              //         side: BorderSide(color: Colors.red)),
              //   ),
              // ),
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                  side: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
              child: const Text("Yes"),
            ),
            ElevatedButton(
              onPressed: actionNo ??
                  () {
                    Navigator.of(context).pop(false);
                  },
              child: const Text("No !"),
            ),
            // RaisedButton(
            //   color: AllocateColors.primary,
            //   onPressed: () {
            //     Navigator.of(context).pop(false);
            //   },
            //   child:
            //       Text("Tidak", style: TextStyle(color: AllocateColors.white)),
            // ),
          ],
        );
      });
}

Future alertCompleteProfile(context, {VoidCallback? onTap}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        insetAnimationDuration: const Duration(milliseconds: 100),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          // use container to change width and height
          height: 290,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const Image(
                image: AssetImage('assets/images/add_favorite.png'),
                fit: BoxFit.fill,
                height: 140,
              ).marginBottom(10),
              Text(
                "Congratulations !!!",
                style: SinarmasFonts().semiBold(size: 15),
              ).marginBottom(6),
              Text(
                "You have successfully added your favorite food",
                style: SinarmasFonts().textStyle(
                    size: 13, color: SinarmasColors.black.withOpacity(0.6)),
                textAlign: TextAlign.center,
              ).marginBottom(6),
              ElevatedButton(
                  onPressed: onTap ??
                      () {
                        Navigator.of(context).pop(false);
                      },
                  child: const Text("Add More Favorite")
                      .marginSymetric(horizontal: 8)),
            ],
          ),
        ),
      );
    },
  );
}
