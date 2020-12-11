import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:green_go/components/styles/app_style.dart';
import 'package:green_go/components/widgets/anim_slider.dart';
import 'package:green_go/components/widgets/custom_loader.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Container(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              AnimSliderWidget(
                h: h,
                w: w,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      'КАТАЛОГ ТОВАРОВ',
                      style: TextStyle(
                        fontSize: 13.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0.h,
                    child: GridView.builder(
                      itemCount: 12,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 2),
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8,
                                      offset: Offset(0, 5),
                                      spreadRadius: 1,
                                      color: Colors.grey[300],
                                    )
                                  ]),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        'https://www.thoughtco.com/thmb/19F0cna2JSUcDnkuv7oUiSYALBQ=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg',
                                    imageBuilder: (context, imageProvider) =>
                                        Center(
                                      child: Container(
                                        width: 19.0.w,
                                        height: 10.0.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
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
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      child: const Center(
                                        child: Icon(
                                          Icons.error_outline_rounded,
                                          color: Colors.red,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(child: Text("data[index]")),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15),
                    child: Text(
                      'Топ товаров',
                      style: TextStyle(
                        fontSize: 13.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0.h,
                    child: Stack(
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 45.0.w,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5,
                                            offset: Offset(0, 5),
                                            spreadRadius: 1,
                                            color: Colors.grey[300],
                                          )
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl:
                                              'https://www.thoughtco.com/thmb/19F0cna2JSUcDnkuv7oUiSYALBQ=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/lotus-flower-828457262-5c6334b646e0fb0001dcd75a.jpg',
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Center(
                                            child: Container(
                                              width: 21.0.w,
                                              height: 11.0.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, string) =>
                                              Center(
                                            child: CustomProgressWidget(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Container(
                                            child: const Center(
                                              child: Icon(
                                                Icons.error_outline_rounded,
                                                color: Colors.red,
                                                size: 25,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Center(
                                            child: Text(
                                              'Королевский свадебный',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.5.sp,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Цена: 30 000',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.5.sp,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.favorite_outline_rounded,
                                        color: AppStyle.colorPurple,
                                      ),
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: IconButton(
                              icon: Icon(Icons.arrow_back_ios_rounded),
                              onPressed: () {}),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: IconButton(
                              icon: Icon(Icons.arrow_forward_ios_rounded),
                              onPressed: () {}),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
