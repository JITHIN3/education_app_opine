import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [1,2,3,4,5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  color: Colors.transparent,
                  child: Image.asset('lib/Assets/slider/slider.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,

                  )
              );
            },
          );
        }).toList(),
        options: CarouselOptions(
          height: 176,
          aspectRatio: 16/9,
          viewportFraction: 1,
          initialPage: 0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          scrollDirection: Axis.horizontal,
        )
    );
  }
}
