import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CarouselWidget extends StatefulWidget {
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
  CarouselWidgetState createState() => CarouselWidgetState();
}

class CarouselWidgetState extends State<CarouselWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 160,
          width: double.infinity,
          child: Swiper(
            loop: true,
            viewportFraction: 0.8,
            scale: 0.9,
            autoplay: true,
            onIndexChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemCount: widget.images.length,
            itemBuilder:
                (context, index) =>
                    CarouselSlide(imagePath: widget.images[index]),
          ),
        ),
        const SizedBox(height: 10),
        _buildIndicators(),
      ],
    );
  }

  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.images.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: index == currentIndex ? Colors.red : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}

class CarouselSlide extends StatelessWidget {
  final String imagePath;

  const CarouselSlide({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 5)),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
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
