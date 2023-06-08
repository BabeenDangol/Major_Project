import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rental/models/post_data.dart';
import 'package:rental/utils/route_names.dart';

class DashboardItem extends StatelessWidget {
  const DashboardItem(this.post, {super.key});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, RouteName.postview),
            child: Container(
              width: 300,
              height: 250,
              margin: EdgeInsets.fromLTRB(0, 15, 5, 20),
              // padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 0.2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.asset(
                      post.imagePath,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 10, 10),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.title,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_city,
                                  size: 14,
                                  color: Colors.black12,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  post.description,
                                  style: TextStyle(
                                      fontSize: 10.5,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 55,
                                ),
                                Text(post.amount)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
