import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rental/screen/Tenantpages/dashboard_list/dashboard_items.dart';
import 'package:rental/screen/Tenantpages/dashboard_list/dashboard_list.dart';
import 'package:rental/utils/route_names.dart';

import '../../models/post_data.dart';

class TenantViewPage extends StatefulWidget {
  const TenantViewPage({super.key});

  @override
  State<TenantViewPage> createState() => _TenantViewPageState();
}

class _TenantViewPageState extends State<TenantViewPage> {
  final List<Post> imageList = [
    Post(
      'assets/images/modern.jpg',
      'Kathmandu',
      '5000',
      'Kathmandu,Kritipur',
    ),
    Post(
      'assets/images/modern.jpg',
      'Patan',
      '6000',
      'Lalitpur,Patan',
    ),
    Post(
      'assets/images/modern.jpg',
      'Kritipur',
      '7000',
      'Kathmandu,Kritipur',
    ),
  ];

  int _currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 8,
          backgroundColor: Color.fromARGB(255, 69, 101, 95),
          title: Row(
            children: [
              Icon(Icons.home),
              SizedBox(
                width: 5,
              ),
              Text(
                "Home",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 290,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: Offset(0.0, 1.0),
                    color: Colors.grey,
                  )
                ]),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 30,
                      left: 5,
                      right: 5,
                      child: Image.asset(
                        'assets/images/modern.jpg',
                        width: 500,
                        height: 600,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 150,
                      child: Text(
                        "Hello World",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      width: 500,
                      height: 600,
                    ),
                    Positioned(
                      top: 230.0,
                      left: 16.0,
                      right: 16.0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ]),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Get Started With",
                      style: TextStyle(
                        fontSize: 16,
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
              const SizedBox(
                height: 20,
              ),
              DashboardList(posts: imageList),
              SizedBox(
                height: 25,
              ),
              IconRow(),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ));
  }
}

class IconItem {
  final String name;
  final IconData icon;
  final String imageurl;
  IconItem({required this.icon, required this.name, required this.imageurl});
}

class IconRow extends StatelessWidget {
  final List<IconItem> icons = [
    IconItem(
        icon: Icons.location_city,
        name: "Baneshwor",
        imageurl: 'assets/images/Kathmandu.jpg'),
    IconItem(
        icon: Icons.location_city,
        name: "Kritipur",
        imageurl: 'assets/images/Patan.jpg'),
    IconItem(
        icon: Icons.location_city,
        name: "Lalitpur",
        imageurl: 'assets/images/Patan.jpg'),
    IconItem(
        icon: Icons.location_city,
        name: "Putalisadak",
        imageurl: 'assets/images/Kathmandu.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          icons.length,
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, RouteName.postview),
              child: Column(
                children: [
                  CircleAvatar(
                    maxRadius: 35,
                    backgroundImage: AssetImage(icons[index].imageurl),
                    // backgroundColor: Color.fromARGB(255, 69, 101, 95),
                    child: Icon(
                      icons[index].icon,
                      color: Colors.white,
                    ),
                  ),
                  Text(icons[index].name)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
