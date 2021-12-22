import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sinarmas/presenter/extension/color.dart';
import 'package:sinarmas/presenter/extension/fonts.dart';

Widget myTextFormFieldSearchWithBorder(context,
    {typeInput,
    controller,
    capitalization,
    keyboardType,
    hint,
    textInputAction,
    onChange}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
    ),
    child: TextFormField(
      inputFormatters: [
        typeInput == 'number'
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.deny(RegExp("[/\\\\]")),
      ],
      cursorColor: SinarmasColors.primary,
      controller: controller,
      textCapitalization: capitalization ?? TextCapitalization.none,
      keyboardType: keyboardType,
      textInputAction: textInputAction ?? TextInputAction.done,
      style: SinarmasFonts().regular(),
      onFieldSubmitted: (term) {},
      onChanged: onChange,
      decoration: InputDecoration(
        prefixIcon: const Padding(
            padding: EdgeInsets.all(14.0), child: Icon(Icons.search, size: 24)),
        filled: true,
        fillColor: SinarmasColors.white,
        contentPadding: const EdgeInsets.fromLTRB(20, 13, 0, 0),
        hintText: hint,
        hintStyle: SinarmasFonts().regular().copyWith(
            fontWeight: FontWeight.w300,
            color: SinarmasColors.black.withOpacity(0.5)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: SinarmasColors.lightGrey,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: SinarmasColors.lightGrey,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: SinarmasColors.lightGrey,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),
    ),
  );
}
