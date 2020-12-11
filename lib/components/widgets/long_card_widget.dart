import 'package:flutter/material.dart';
import 'package:green_go/components/styles/app_style.dart';
import 'package:sizer/sizer.dart';

class CardLongWidget extends StatelessWidget {
  final String title;

  const CardLongWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            offset: Offset(0, 6),
            blurRadius: 7,
          )
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              this.title,
              style: TextStyle(
                fontSize: 12.0.sp,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppStyle.colorPurple,
              size: 15.0.sp,
            ),
          ],
        ),
      ),
    );
  }
}
