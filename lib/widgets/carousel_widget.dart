import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CarouselWidget extends StatelessWidget {
  final List<String> images = [
    'assets/pexels/pexels-78563786-10764538.jpg',
    'assets/pexels/pexels-edwardeyer-1066859.jpg',
    'assets/pexels/pexels-henry-de-guzman-72935623-10134616.jpg',
    'assets/pexels/pexels-moises-ribeiro-121009898-11462903.jpg',
    'assets/pexels/pexels-polina-tankilevitch-4109121.jpg',
    'assets/pexels/pexels-tadahiro-munakata-384728139-18338973.jpg',
  ];

  CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        loop: true,
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        pagination: const SwiperPagination(
          margin: EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.red,
            color: Colors.grey,
          ),
        ),
        itemCount: images.length,
        itemBuilder:
            (context, index) => _CarouselSlide(imagePath: images[index]),
      ),
    );
  }
}

class _CarouselSlide extends StatelessWidget {
  final String imagePath;

  const _CarouselSlide({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 5)),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            onTap: () {
              // Ação ao clicar na imagem, se necessário
            },
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
