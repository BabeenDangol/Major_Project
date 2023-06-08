import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rental/models/post_data.dart';
import 'package:rental/screen/Tenantpages/dashboard_list/dashboard_items.dart';

class DashboardList extends StatelessWidget {
  const DashboardList({required this.posts, super.key});
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: posts.length,
        itemBuilder: (context, index) => Container(
          height: 300,
          child: DashboardItem(
            posts[index],
          ),
        ),
      ),
    );
  }
}
