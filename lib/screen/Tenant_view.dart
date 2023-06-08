import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:rental/screen/login.dart';

class TenantViewPage extends StatefulWidget {
  const TenantViewPage({super.key});

  @override
  State<TenantViewPage> createState() => _TenantViewPageState();
}

class _TenantViewPageState extends State<TenantViewPage> {
  final List<String> imageUrls = [
    'https://w0.peakpx.com/wallpaper/135/412/HD-wallpaper-iron-man-death-iron-man-sad.jpg',
    'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/3/35/IronMan-EndgameProfile.jpg/revision/latest/scale-to-width-down/1200?cb=20190423175213',
    'https://cdn.britannica.com/26/187026-138-00A23A77/science-fiction-powers-Marvel-Comics-Avengers.jpg?w=800&h=450&c=crop',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tenants"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              height: 290,
              child: Stack(
                children: [
                  // CarouselSlider(
                  //   options: CarouselOptions(
                  //     height: 250.0,
                  //     autoPlay: true,
                  //   ),
                  //   items: imageUrls.map((imageUrl) {
                  //     return Container(
                  //       width: MediaQuery.of(context).size.width,
                  //       margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20),
                  //         color: Colors.white,
                  //         image: DecorationImage(
                  //           image: NetworkImage(imageUrl),
                  //           fit: BoxFit.cover,
                  //         ),
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                  Positioned(
                    top: 220.0,
                    left: 16.0,
                    right: 16.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 213, 187, 215),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Get Started With",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Handpicked apartments and rooms for you",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 250.0,
                autoPlay: false,
              ),
              items: imageUrls.map((imageUrl) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
