import 'package:flutter/material.dart';
import 'package:green_go/components/widgets/custom_dialog.dart';
import 'package:green_go/core/data/dialog_type.dart';

Future<bool> displayCustomDialog(
  BuildContext context,
  String _title,
  DialogType dialogType,
  bool barrierDismissible,
  Function onPressed, [
  String negativeText,
  String positiveText,
]) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) => CustomActionDialog(
      title: _title,
      dialogType: dialogType,
      onPressed: onPressed,
      cancelOptionText: negativeText,
      confirmOptionText: positiveText,
    ),
  );
}

void showCustomSnackBar(
    BuildContext context, String text, Color color, IconData iconData) {
  Scaffold.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 10),
        backgroundColor: color,
        behavior: SnackBarBehavior.fixed,
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {},
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(iconData, color: Colors.white),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "$text",
                  style: TextStyle(color: Colors.white, fontFamily: 'Rubik'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
}
