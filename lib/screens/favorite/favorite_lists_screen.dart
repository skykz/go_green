import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:green_go/components/styles/app_style.dart';
import 'package:green_go/components/widgets/custom_loader.dart';
import 'package:sizer/sizer.dart';

class FavoriteListScreen extends StatelessWidget {
  const FavoriteListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: const EdgeInsets.all(15),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 20.0.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 10,
                      offset: Offset(0, 7),
                      spreadRadius: 1,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://www.thoughtco.com/thmb/19F0cna2JSUcDnkuv7oUiSYALBQ=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg',
                        imageBuilder: (context, imageProvider) => Center(
                          child: Container(
                            width: 21.0.w,
                            height: 11.0.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        placeholder: (context, string) => Center(
                          child: CustomProgressWidget(
                            color: Colors.grey,
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          child: const Center(
                            child: Icon(
                              Icons.error_outline_rounded,
                              color: Colors.red,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Букет с гортензией',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.0.sp,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Магазин:\n',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 10.0.sp,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Rosalie',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.0.sp),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Рейтинг:',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 10.0.sp,
                                    ),
                                  ),
                                  RatingBarIndicator(
                                    rating: 3.5,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star_rounded,
                                      color: AppStyle.colorPurple,
                                    ),
                                    itemCount: 5,
                                    unratedColor: Colors.grey[300],
                                    itemSize: 13.0.sp,
                                    direction: Axis.horizontal,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Цена 13 000',
                              style: TextStyle(
                                fontSize: 11.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_rounded,
                    color: AppStyle.colorPurple,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
