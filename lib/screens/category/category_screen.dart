import 'package:flutter/material.dart';
import 'package:green_go/components/widgets/long_card_widget.dart';
import 'package:sizer/sizer.dart';

class CategoryScreen extends StatelessWidget {
  final bool isStore;

  const CategoryScreen({Key key, this.isStore = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Text(
              this.isStore ? "Магазин" : "Категории",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.0.sp,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: CardLongWidget(
                      title: "$index categoryName",
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
