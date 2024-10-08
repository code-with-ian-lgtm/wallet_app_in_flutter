import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AdSliderRow extends StatelessWidget {
  const AdSliderRow({super.key});

  @override
  Widget build(BuildContext context) {
    // List of images, company logos, and names
    final List<Map<String, String>> ads = [
      {
        'image': 'lib/assets/promotion1.jpeg',
        'logo': 'lib/assets/adidas.jpeg',
        'name': 'Adidas Inc',
      },
      {
        'image': 'lib/assets/promotion2.jpeg',
        'logo': 'lib/assets/amazon.jpeg',
        'name': 'Amazon',
      },
      {
        'image': 'lib/assets/promotion3.jpeg',
        'logo': 'lib/assets/macdonalds.jpeg',
        'name': 'Macdonalds',
      },
      {
        'image': 'lib/assets/promotion01.jpeg',
        'logo': 'lib/assets/macdonalds.jpeg',
        'name': 'Macdonalds',
      },
      {
        'image': 'lib/assets/promotion02.jpeg',
        'logo': 'lib/assets/dominos.jpeg',
        'name': 'Dominos Pizza',
      },
            {
        'image': 'lib/assets/promotion4.jpeg',
        'logo': 'lib/assets/Starbucks.jpeg',
        'name': 'Starbucks',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(10),
      child: CarouselSlider.builder(
        itemCount: ads.length,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          height: 200,
          viewportFraction: 0.8, 
        ),
        itemBuilder: (BuildContext context, int index, int realIndex) {
          final ad = ads[index]; 

          return Stack(
            children: [
              // Image Slider
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  ad['image']!,  
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              // Positioned Logo and Text
              Positioned(
                bottom: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Company logo
                    GestureDetector(
                      onTap: () {
                        // Navigate to company page or perform an action
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          ad['logo']!,  
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Company name or promotional text
                    GestureDetector(
                      onTap: () {
                        // Navigate to company page or perform an action
                      },
                      child: Text(
                        ad['name']!,  // Dynamically load company name
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
